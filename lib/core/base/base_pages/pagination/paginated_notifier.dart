import 'package:base_flutter_proj/core/base/base_pages/pagination/paginated_state.dart';
import 'package:base_flutter_proj/core/errors/error_mapper.dart';
import 'package:base_flutter_proj/core/helpers/async_executor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaginatedPage<T> {
  const PaginatedPage({required this.items, required this.hasNext});

  final List<T> items;
  final bool hasNext;
}

/// Стандартный паттерн пагинации в проекте.
/// Наследуйте для списков с подгрузкой страниц.
abstract class PaginatedNotifier<T> extends Notifier<PaginatedState<T>> {
  final AsyncExecutor _executor = AsyncExecutor();

  @override
  PaginatedState<T> build() {
    ref.onDispose(_executor.invalidate);
    final generation = _executor.capture();
    Future.microtask(() {
      if (_executor.isCurrentGeneration(generation)) loadInitial();
    });
    return PaginatedState<T>();
  }

  int get firstPage => 1;

  int _page = 1;
  bool _requestInProgress = false;

  Future<PaginatedPage<T>> loadPage(int page);

  /// Отменяет применение предыдущих ответов перед сменой параметров списка.
  void prepareForNewQuery() {
    _executor.invalidate();
    _requestInProgress = false;
    _page = firstPage;
    state = state.copyWith(
      items: [],
      isLoading: true,
      isRefreshing: false,
      isLoadingMore: false,
      isAllLoaded: false,
      clearError: true,
    );
  }

  Future<void> loadInitial() async {
    if (_requestInProgress) return;

    final generation = _executor.capture();
    _requestInProgress = true;
    state = state.copyWith(
      isLoading: true,
      isRefreshing: false,
      isLoadingMore: false,
      clearError: true,
      isAllLoaded: false,
      items: [],
    );

    try {
      final page = await loadPage(firstPage);
      if (!_executor.isCurrentGeneration(generation)) return;

      _page = firstPage;
      state = state.copyWith(
        items: page.items,
        isLoading: false,
        isAllLoaded: !page.hasNext,
      );
    } catch (error) {
      if (!_executor.isCurrentGeneration(generation)) return;
      final mapped = ErrorMapper.from(error);
      state = state.copyWith(
        isLoading: false,
        errorCode: mapped.code,
        serverMessage: mapped.serverMessage,
      );
    } finally {
      if (_executor.isCurrentGeneration(generation)) {
        _requestInProgress = false;
      }
    }
  }

  Future<void> reload() async {
    if (_requestInProgress) return;

    final generation = _executor.capture();
    _requestInProgress = true;
    state = state.copyWith(isRefreshing: true, clearError: true);

    try {
      final page = await loadPage(firstPage);
      if (!_executor.isCurrentGeneration(generation)) return;

      _page = firstPage;
      state = state.copyWith(
        items: page.items,
        isRefreshing: false,
        isAllLoaded: !page.hasNext,
      );
    } catch (error) {
      if (!_executor.isCurrentGeneration(generation)) return;
      final mapped = ErrorMapper.from(error);
      state = state.copyWith(
        isRefreshing: false,
        isRefreshError: true,
        errorCode: mapped.code,
        serverMessage: mapped.serverMessage,
      );
    } finally {
      if (_executor.isCurrentGeneration(generation)) {
        _requestInProgress = false;
      }
    }
  }

  Future<void> loadMore() async {
    if (_requestInProgress ||
        state.isAllLoaded ||
        state.hasError ||
        (state.items.isEmpty && state.isLoading)) {
      return;
    }

    final generation = _executor.capture();
    _requestInProgress = true;
    state = state.copyWith(isLoadingMore: true, clearError: true);

    try {
      final nextPage = _page + 1;
      final page = await loadPage(nextPage);
      if (!_executor.isCurrentGeneration(generation)) return;

      _page = nextPage;

      state = state.copyWith(
        items: [...state.items, ...page.items],
        isLoadingMore: false,
        isAllLoaded: !page.hasNext,
      );
    } catch (error) {
      if (!_executor.isCurrentGeneration(generation)) return;
      final mapped = ErrorMapper.from(error);
      state = state.copyWith(
        isLoadingMore: false,
        errorCode: mapped.code,
        serverMessage: mapped.serverMessage,
      );
    } finally {
      if (_executor.isCurrentGeneration(generation)) {
        _requestInProgress = false;
      }
    }
  }

  Future<void> retryLoadMore() async {
    clearError();
    await loadMore();
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
