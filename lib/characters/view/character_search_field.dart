import 'package:base_flutter_proj/core/components/decorated_text_form_field.dart';
import 'package:base_flutter_proj/core/providers/theme_provider.dart';
import 'package:base_flutter_proj/core/theme/theme_builder.dart';
import 'package:base_flutter_proj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSearchField extends ConsumerWidget {
  const CharacterSearchField({
    required this.controller,
    required this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = S.of(context);
    final theme = ref.watch(themeBuilderProvider);
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) => DecoratedTextFormField(
        controller: controller,
        onChanged: (value) => onChanged(value ?? ''),
        style: AppTextStyle.body2,
        textInputAction: TextInputAction.search,
        decoration: theme.buildSearchInputDecoration().copyWith(
          hintText: l10n.charactersSearchHint,
        ),
        prefix: const Icon(Icons.search, color: AppColors.hint),
        suffix: value.text.isEmpty
            ? null
            : IconButton(
                tooltip: l10n.charactersSearchClear,
                onPressed: controller.clear,
                icon: const Icon(Icons.close, color: AppColors.hint),
              ),
      ),
    );
  }
}
