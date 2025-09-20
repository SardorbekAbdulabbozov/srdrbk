import 'package:srdrbk/main_page/data/model/info.dart';
import 'package:web/web.dart' as html;
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
  const GetInTouchSection({super.key, this.info});

  final Info? info;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 112, vertical: 96),
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
              style: AppTextStyles.desktopSubtitleNormal.copyWith(
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/vectors/email.svg',
                      width: 32,
                      height: 32,
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
                        info?.email ?? "",
                        style: AppTextStyles.desktopHeading2SemiBold.copyWith(
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark900
                              : AppColors.grayLight900,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await Clipboard.setData(
                          ClipboardData(text: info?.email ?? ""),
                        ).then(
                          (value) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(
                              scaffoldKeyDesktop.currentContext!,
                            ).showSnackBar(
                              SnackBar(
                                backgroundColor:
                                    BaseFunctions.isDarkMode(context)
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
                            );
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark50
                              : AppColors.grayLight50,
                        ),
                      ),
                      icon: SvgPicture.asset(
                        'assets/vectors/copy.svg',
                        width: 32,
                        height: 32,
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
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/vectors/phone.svg',
                      width: 32,
                      height: 32,
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
                        info?.phoneNumber ?? "",
                        style: AppTextStyles.desktopHeading2SemiBold.copyWith(
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark900
                              : AppColors.grayLight900,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await Clipboard.setData(
                          ClipboardData(text: info?.phoneNumber ?? ""),
                        ).then(
                          (value) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(
                              scaffoldKeyDesktop.currentContext!,
                            ).showSnackBar(
                              SnackBar(
                                backgroundColor:
                                    BaseFunctions.isDarkMode(context)
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
                            );
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark50
                              : AppColors.grayLight50,
                        ),
                      ),
                      icon: SvgPicture.asset(
                        'assets/vectors/copy.svg',
                        width: 32,
                        height: 32,
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48, bottom: 8),
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
                  backgroundColor: WidgetStatePropertyAll(
                    BaseFunctions.isDarkMode(context)
                        ? AppColors.grayDark50
                        : AppColors.grayLight50,
                  ),
                ),
                onPressed: () {
                  html.window.open(info?.githubUrl ?? '', "_blank");
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
                    backgroundColor: WidgetStatePropertyAll(
                      BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDark50
                          : AppColors.grayLight50,
                    ),
                  ),
                  onPressed: () {
                    html.window.open(info?.linkedinUrl ?? "", "_blank");
                  },
                  icon: Center(
                    child: Image.asset(
                      'assets/images/linkedin.png',
                      width: 26,
                      height: 26,
                      color: BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDark600
                          : AppColors.grayLight600,
                    ),
                  ),
                ),
              ),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    BaseFunctions.isDarkMode(context)
                        ? AppColors.grayDark50
                        : AppColors.grayLight50,
                  ),
                ),
                onPressed: () {
                  html.window.open(info?.telegramUrl ?? "", "_blank");
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
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDark50
                          : AppColors.grayLight50,
                    ),
                  ),
                  onPressed: () {
                    html.window.open(info?.xUrl ?? "", "_blank");
                  },
                  icon: Center(
                    child: Image.asset(
                      'assets/images/x.png',
                      width: 22,
                      height: 22,
                      color: BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDark600
                          : AppColors.grayLight600,
                    ),
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
