import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key, this.generalInfo, this.mainPhoto});

  final String? generalInfo;
  final String? mainPhoto;

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
          ? AppColors.grayDarkDefault
          : AppColors.grayLightDefault,
      child: Column(
        children: [
          AnimatedOpacity(
            opacity: size.height > 610 ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              width: (photoSize * 7 / 8),
              height: photoSize + 20,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    top: 20,
                    child: Container(
                      color: BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDarkDefault
                          : AppColors.grayLightDefault,
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
                          ? AppColors.grayDarkDefault
                          : AppColors.grayLightDefault,
                      width: photoSize * 7 / 8 - 40,
                      height: photoSize,
                      padding: const EdgeInsets.all(8),
                      child: ColoredBox(
                        color: BaseFunctions.isDarkMode(context)
                            ? AppColors.grayDark200
                            : AppColors.grayLight200,
                        child: Image.asset(
                          'assets/images/${mainPhoto ?? "photo1.jpg"}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          'Hi, I’m Sardorbek',
                          style: AppTextStyles.mobileHeading1SemiBold.copyWith(
                            color: BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark900
                                : AppColors.grayLight900,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/vectors/wavingHand.svg',
                        height: 48,
                        width: 48,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    generalInfo?.replaceAll("***",
                            "${BaseFunctions.calculateExperienceInYears()}") ??
                        "",
                    style: AppTextStyles.allBody2Normal.copyWith(
                      color: BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDark600
                          : AppColors.grayLight600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 48),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          'assets/vectors/location.svg',
                          height: 24,
                          width: 24,
                          colorFilter: ColorFilter.mode(
                            BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark600
                                : AppColors.grayLight600,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Text(
                        'Tashkent, Uzbekistan',
                        style: AppTextStyles.allBody2Normal.copyWith(
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark600
                              : AppColors.grayLight600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Center(
                            child: CircleAvatar(
                              radius: 4,
                              backgroundColor: AppColors.emerald,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Available for new career opportunities',
                        style: AppTextStyles.allBody2Normal.copyWith(
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark600
                              : AppColors.grayLight600,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        html.window.open(
                          'https://github.com/SardorbekAbdulabbozov',
                          "_blank",
                        );
                      },
                      icon: Center(
                        child: Image.asset(
                          'assets/images/github.png',
                          width: 24,
                          height: 24,
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark600
                              : AppColors.grayLight600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: IconButton(
                        onPressed: () {
                          html.window.open(
                            'https://www.linkedin.com/in/sardorbek-abdulabbozov/',
                            "_blank",
                          );
                        },
                        icon: Center(
                          child: Image.asset(
                            'assets/images/linkedin.png',
                            width: 24,
                            height: 24,
                            color: BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark600
                                : AppColors.grayLight600,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        html.window
                            .open('https://t.me/abdulabbozov_s', "_blank");
                      },
                      icon: Center(
                        child: Image.asset(
                          'assets/images/telegram2.png',
                          width: 24,
                          height: 24,
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark600
                              : AppColors.grayLight600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
