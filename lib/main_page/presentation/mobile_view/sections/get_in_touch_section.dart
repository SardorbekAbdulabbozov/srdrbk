import 'dart:html' as html;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srdrbk/components/global_variables.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/config/localization/locale_keys.g.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';

class GetInTouchSection extends StatelessWidget {
  const GetInTouchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      color: BaseFunctions.isDarkMode(context)
          ? AppColors.grayDark50
          : AppColors.grayLight50,
      child: Column(
        children: [
          Chip(
            label: Text(
              LocaleKeys.getInTouch.tr(),
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
              LocaleKeys.contactMethods.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.mobileTabletSubtitleNormal.copyWith(
                color: BaseFunctions.isDarkMode(context)
                    ? AppColors.grayDark600
                    : AppColors.grayLight600,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/vectors/email.svg',
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark600
                              : AppColors.grayLight600,
                          BlendMode.srcIn,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "abdulabbozov.dev@gmail.com",
                          style:
                              AppTextStyles.mobileTabletHeading2SemiBold.copyWith(
                            color: BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark900
                                : AppColors.grayLight900,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await Clipboard.setData(
                            const ClipboardData(
                              text: "abdulabbozov.dev@gmail.com",
                            ),
                          ).then(
                            (value) => ScaffoldMessenger.of(
                              scaffoldKeyMobile.currentContext!,
                            ).showSnackBar(
                              SnackBar(
                                backgroundColor: BaseFunctions.isDarkMode(context)
                                    ? AppColors.grayLightDefault
                                    : AppColors.grayDarkDefault,
                                duration: const Duration(seconds: 2),
                                content: Text(
                                  'Copied to clipboard',
                                  style: AppTextStyles.allBody2Normal.copyWith(
                                    color: BaseFunctions.isDarkMode(context)
                                        ? AppColors.grayDarkDefault
                                        : AppColors.grayLightDefault,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark50
                                : AppColors.grayLight50,
                          ),
                        ),
                        icon: SvgPicture.asset(
                          'assets/vectors/copy.svg',
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark600
                                : AppColors.grayLight600,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/vectors/phone.svg',
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark600
                              : AppColors.grayLight600,
                          BlendMode.srcIn,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "+998 90-912-15-50",
                          style:
                              AppTextStyles.mobileTabletHeading2SemiBold.copyWith(
                            color: BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark900
                                : AppColors.grayLight900,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await Clipboard.setData(
                            const ClipboardData(text: "+998909121550"),
                          ).then(
                            (value) => ScaffoldMessenger.of(
                              scaffoldKeyMobile.currentContext!,
                            ).showSnackBar(
                              SnackBar(
                                backgroundColor: BaseFunctions.isDarkMode(context)
                                    ? AppColors.grayLightDefault
                                    : AppColors.grayDarkDefault,
                                duration: const Duration(seconds: 2),
                                content: Text(
                                  'Copied to clipboard',
                                  style: AppTextStyles.allBody2Normal.copyWith(
                                    color: BaseFunctions.isDarkMode(context)
                                        ? AppColors.grayDarkDefault
                                        : AppColors.grayLightDefault,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark50
                                : AppColors.grayLight50,
                          ),
                        ),
                        icon: SvgPicture.asset(
                          'assets/vectors/copy.svg',
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark600
                                : AppColors.grayLight600,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 8),
            child: Text(
              LocaleKeys.profileOnPlatfroms.tr(),
              style: AppTextStyles.allBody2Normal.copyWith(
                color: BaseFunctions.isDarkMode(context)
                    ? AppColors.grayDark600
                    : AppColors.grayLight600,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    BaseFunctions.isDarkMode(context)
                        ? AppColors.grayDark50
                        : AppColors.grayLight50,
                  ),
                ),
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDark50
                          : AppColors.grayLight50,
                    ),
                  ),
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
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    BaseFunctions.isDarkMode(context)
                        ? AppColors.grayDark50
                        : AppColors.grayLight50,
                  ),
                ),
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
    );
  }
}
