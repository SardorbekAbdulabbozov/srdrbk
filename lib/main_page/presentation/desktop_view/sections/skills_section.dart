import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:srdrbk/components/extension/app_extensions.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/config/localization/locale_keys.g.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static List<String> skills = [
    "git",
    "c++",
    "java",
    "dart",
    "flutter",
    "firebase",
    "figma",
    "swift",
    "swiftui",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 112, vertical: 96),
      color: BaseFunctions.isDarkMode(context)
          ? AppColors.grayDarkDefault
          : AppColors.grayLightDefault,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chip(
            label: Text(
              LocaleKeys.skills.tr(),
              style: AppTextStyles.allBody3Medium.copyWith(
                color: BaseFunctions.isDarkMode(context)
                    ? AppColors.grayDark600
                    : AppColors.grayLight600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 48),
            child: Text(
              LocaleKeys.skillsDescription.tr(),
              style: AppTextStyles.desktopSubtitleNormal.copyWith(
                color: BaseFunctions.isDarkMode(context)
                    ? AppColors.grayDark600
                    : AppColors.grayLight600,
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: skills.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 16,
              childAspectRatio: 75 / (64 + 8 + 35),
              crossAxisSpacing: (size.width - 2 * 112 - 75 * 5) / 4,
            ),
            itemBuilder: (_, i) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset(
                      "assets/images/${skills[i]}.png",
                      width: 64,
                      height: 64,
                    ),
                  ),
                  Text(
                    skills[i].capitalize().replaceAll("ui", "UI"),
                    style: AppTextStyles.mobileTabletBody1Normal.copyWith(
                      color: BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDark600
                          : AppColors.grayLight600,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
