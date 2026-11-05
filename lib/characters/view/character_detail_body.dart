import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:base_flutter_proj/characters/view/character_status.dart';
import 'package:base_flutter_proj/core/components/safe_network_image.dart';
import 'package:base_flutter_proj/core/theme/theme_builder.dart';
import 'package:base_flutter_proj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CharacterDetailBody extends StatelessWidget {
  const CharacterDetailBody({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return ListView(
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                ThemeBuilder.cardBorderRadius,
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: SafeNetworkImage(imageUrl: character.image),
              ),
            ),
          ),
        ),
        const Gap(24),
        Text(character.name, style: AppTextStyle.screenTitle),
        const Gap(16),
        _buildDetailField(
          label: l10n.characterDetailStatus,
          child: CharacterStatus(status: character.status),
        ),
        _buildDetailField(
          label: l10n.characterDetailSpecies,
          child: Text(character.species, style: AppTextStyle.body2),
        ),
        _buildDetailField(
          label: l10n.characterDetailOrigin,
          child: Text(character.origin.name, style: AppTextStyle.body2),
        ),
        _buildDetailField(
          label: l10n.characterDetailLocation,
          child: Text(character.location.name, style: AppTextStyle.body2),
        ),
      ],
    );
  }

  Widget _buildDetailField({required String label, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyle.subtitle),
          child,
        ],
      ),
    );
  }
}
