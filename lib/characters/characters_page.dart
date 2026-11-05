import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:base_flutter_proj/characters/providers/characters_list_notifier.dart';
import 'package:base_flutter_proj/characters/view/character_tile.dart';
import 'package:base_flutter_proj/core/base/base_pages/app_page_scaffold.dart';
import 'package:base_flutter_proj/core/base/base_pages/pagination/paginated_list_layout.dart';
import 'package:base_flutter_proj/core/base/base_pages/pagination/paginated_list_view.dart';
import 'package:base_flutter_proj/core/components/empty_state_widget.dart';
import 'package:base_flutter_proj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

Widget _separator(BuildContext context, int index) => const Gap(12);

class CharactersPage extends ConsumerWidget {
  const CharactersPage({super.key});

  static const _layout = PaginatedListLayout(separatorBuilder: _separator);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = S.of(context);
    final state = ref.watch(charactersListProvider);
    final notifier = ref.read(charactersListProvider.notifier);

    return AppPageScaffold(
      appBarConfig: AppPageAppBarConfig(title: l10n.charactersTitle),
      body: PaginatedListView<Character>(
        state: state,
        listLayout: _layout,
        onRefresh: notifier.reload,
        onLoadMore: notifier.loadMore,
        onLoadMoreRetry: notifier.retryLoadMore,
        onRetry: notifier.loadInitial,
        empty: EmptyStateWidget(title: l10n.charactersEmpty),
        itemBuilder: (context, character, index) =>
            CharacterTile(character: character),
      ),
    );
  }
}
