import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:base_flutter_proj/characters/providers/character_detail_notifier.dart';
import 'package:base_flutter_proj/characters/view/character_detail_body.dart';
import 'package:base_flutter_proj/core/base/base_pages/app_page_scaffold.dart';
import 'package:base_flutter_proj/core/components/entity_state_builder.dart';
import 'package:base_flutter_proj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterDetailPage extends ConsumerWidget {
  const CharacterDetailPage({required this.characterId, super.key});

  final int characterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(characterDetailProvider(characterId));
    final notifier = ref.read(characterDetailProvider(characterId).notifier);
    return AppPageScaffold(
      appBarConfig: AppPageAppBarConfig(
        title: S.of(context).characterDetailTitle,
      ),
      body: EntityStateBuilder<Character>(
        state: state,
        onRetry: notifier.reload,
        dataBuilder: (character) => CharacterDetailBody(character: character),
      ),
    );
  }
}
