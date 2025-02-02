import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/config/localization/locale_keys.g.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key, this.aboutMe, this.secondaryPhoto});

  final String? aboutMe;
  final String? secondaryPhoto;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final photoSize = size.height - 68 - 96 * 2 - 40;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 112, vertical: 96),
      color: BaseFunctions.isDarkMode(context)
          ? AppColors.grayDark50
          : AppColors.grayLight50,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: Chip(
              label: Text(
                LocaleKeys.aboutMe.tr(),
                style: AppTextStyles.allBody3Medium.copyWith(
                  color: BaseFunctions.isDarkMode(context)
                      ? AppColors.grayDark600
                      : AppColors.grayLight600,
                ),
              ),
            ),
          ),
          Row(
            children: [
              AnimatedOpacity(
                opacity: size.height > 610 ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: (photoSize * 7 / (8 * 1.5)) + 40,
                  height: (photoSize / 1.5) + 40,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 40,
                        right: 40,
                        child: Container(
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark50
                              : AppColors.grayLight50,
                          width: photoSize * 7 / (8 * 1.5),
                          height: photoSize / 1.5,
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            color: BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark200
                                : AppColors.grayLight200,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        left: 40,
                        child: Container(
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark50
                              : AppColors.grayLight50,
                          width: photoSize * 7 / (8 * 1.5),
                          height: photoSize / 1.5,
                          padding: const EdgeInsets.all(8),
                          child: ColoredBox(
                            color: BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark200
                                : AppColors.grayLight200,
                            child: Image.asset(
                              'assets/images/${secondaryPhoto ?? "photo2.jpg"}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 192),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(
                          "Curious about me? Here you have it:",
                          style: AppTextStyles.desktopHeading3SemiBold.copyWith(
                            color: BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark900
                                : AppColors.grayLight900,
                          ),
                        ),
                      ),
                      Text(
                        (aboutMe ?? "").replaceAll("###", "\n\n"),
                        style: AppTextStyles.allBody2Normal.copyWith(
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark600
                              : AppColors.grayLight600,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
