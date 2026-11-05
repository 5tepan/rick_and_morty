import 'package:base_flutter_proj/core/theme/theme_builder.dart';
import 'package:base_flutter_proj/generated/l10n.dart';
import 'package:flutter/material.dart';

class CharacterStatus extends StatelessWidget {
  const CharacterStatus({required this.status, super.key});

  final String status;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final (label, color) = switch (status.toLowerCase()) {
      'alive' => (l10n.characterStatusAlive, AppColors.statusAlive),
      'dead' => (l10n.characterStatusDead, AppColors.statusDead),
      _ => (l10n.characterStatusUnknown, AppColors.statusUnknown),
    };
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        Flexible(child: Text(label, style: AppTextStyle.subtitle)),
      ],
    );
  }
}
