import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/config/localization/locale_keys.g.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key, this.aboutMe});

  final String? aboutMe;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final photoSize = (size.height - 68 - 64 * 2) / 2;
    final isTablet = BaseFunctions.isTablet(context);
    return Container(
      width: size.width,
      padding:
          EdgeInsets.symmetric(horizontal: isTablet ? 36 : 16, vertical: 64),
      color: BaseFunctions.isDarkMode(context)
          ? AppColors.grayDark50
          : AppColors.grayLight50,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
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
          Column(
            children: [
              AnimatedOpacity(
                opacity: size.height > 610 ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: photoSize * 7 / 8,
                  height: photoSize + 20,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        top: 20,
                        child: Container(
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark50
                              : AppColors.grayLight50,
                          width: photoSize * 7 / 8,
                          height: photoSize,
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            color: BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark200
                                : AppColors.grayLight200,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: Container(
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark50
                              : AppColors.grayLight50,
                          width: photoSize * 7 / 8 - 40,
                          height: photoSize,
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            'assets/images/photo2.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24, top: 48),
                    child: Text(
                      "Curious about me? Here you have it:",
                      style:
                          AppTextStyles.mobileTabletHeading3SemiBold.copyWith(
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
            ],
          ),
        ],
      ),
    );
  }
}
