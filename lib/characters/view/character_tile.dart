import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:base_flutter_proj/characters/route/characters_route.dart';
import 'package:base_flutter_proj/characters/view/character_status.dart';
import 'package:base_flutter_proj/core/components/safe_network_image.dart';
import 'package:base_flutter_proj/core/theme/theme_builder.dart';
import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () =>
            CharacterDetailRoute(characterId: character.id).push(context),
        child: Row(
          children: [
            SizedBox(
              width: 112,
              height: 112,
              child: SafeNetworkImage(imageUrl: character.image),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(ThemeBuilder.defaultPadding),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style: AppTextStyle.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    CharacterStatus(status: character.status),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
