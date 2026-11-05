import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:base_flutter_proj/core/components/safe_network_image.dart';
import 'package:base_flutter_proj/core/theme/theme_builder.dart';
import 'package:base_flutter_proj/generated/l10n.dart';
import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final (status, color) = switch (character.status.toLowerCase()) {
      'alive' => (l10n.characterStatusAlive, AppColors.statusAlive),
      'dead' => (l10n.characterStatusDead, AppColors.statusDead),
      _ => (l10n.characterStatusUnknown, AppColors.statusUnknown),
    };

    return Card(
      clipBehavior: Clip.antiAlias,
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
                  _buildRow(color, status),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(Color color, String status) {
    return Row(
      spacing: 8,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        Expanded(child: Text(status, style: AppTextStyle.subtitle)),
      ],
    );
  }
}
