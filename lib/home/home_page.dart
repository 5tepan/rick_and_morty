import 'package:base_flutter_proj/core/base/base_pages/app_page_scaffold.dart';
import 'package:base_flutter_proj/core/theme/theme_builder.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      appBarConfig: const AppPageAppBarConfig(needBuildAppBar: false),
      bodyConfig: const AppPageBodyConfig(padding: EdgeInsets.all(24)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.public_rounded,
                color: AppColors.primaryColor,
                size: 36,
              ),
            ),
            const Gap(24),
            const Text(
              'Rick and Morty',
              style: AppTextStyle.screenTitle,
              textAlign: TextAlign.center,
            ),
            const Gap(8),
            const Text(
              'Каталог персонажей',
              style: AppTextStyle.subtitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
