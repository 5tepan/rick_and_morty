import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:base_flutter_proj/characters/providers/characters_list_notifier.dart';
import 'package:base_flutter_proj/characters/view/character_search_field.dart';
import 'package:base_flutter_proj/characters/view/character_tile.dart';
import 'package:base_flutter_proj/core/base/base_pages/app_page_scaffold.dart';
import 'package:base_flutter_proj/core/base/base_pages/pagination/paginated_list_frame.dart';
import 'package:base_flutter_proj/core/base/base_pages/pagination/paginated_list_layout.dart';
import 'package:base_flutter_proj/core/base/base_pages/pagination/paginated_list_view.dart';
import 'package:base_flutter_proj/core/components/empty_state_widget.dart';
import 'package:base_flutter_proj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

Widget _separator(BuildContext context, int index) => const Gap(12);

class CharactersPage extends ConsumerStatefulWidget {
  const CharactersPage({super.key});

  @override
  ConsumerState<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends ConsumerState<CharactersPage> {
  static const _layout = PaginatedListLayout(separatorBuilder: _separator);
  late final TextEditingController _searchController;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: ref.read(charactersListProvider.notifier).query,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    final notifier = ref.read(charactersListProvider.notifier);
    if (notifier.query.trim() != value.trim() && _scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }
    notifier.setQuery(value);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final state = ref.watch(charactersListProvider);
    final notifier = ref.read(charactersListProvider.notifier);

    return AppPageScaffold(
      appBarConfig: AppPageAppBarConfig(title: l10n.charactersTitle),
      body: PaginatedListFrame(
        fixedHeader: Column(
          children: [
            CharacterSearchField(
              controller: _searchController,
              onChanged: _onSearchChanged,
            ),
            const Gap(16),
          ],
        ),
        child: PaginatedListView<Character>(
          controller: _scrollController,
          state: state,
          listLayout: _layout,
          onRefresh: notifier.reload,
          onLoadMore: notifier.loadMore,
          onLoadMoreRetry: notifier.retryLoadMore,
          onRetry: notifier.loadInitial,
          empty: EmptyStateWidget(
            title: notifier.query.trim().isEmpty
                ? l10n.charactersEmpty
                : l10n.charactersSearchEmpty,
          ),
          itemBuilder: (context, character, index) =>
              CharacterTile(character: character),
        ),
      ),
    );
  }
}
