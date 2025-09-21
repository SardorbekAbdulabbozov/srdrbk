import 'package:srdrbk/core/analytics/analytics_service.dart';
import 'package:srdrbk/core/constants/constants.dart';
import 'package:web/web.dart' as html;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key, required this.linkedinUrl});

  final String linkedinUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 24),
      color: BaseFunctions.isDarkMode(context)
          ? AppColors.grayDarkDefault
          : AppColors.grayLightDefault,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  'assets/vectors/copyright.svg',
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(
                    BaseFunctions.isDarkMode(context)
                        ? AppColors.grayDark600
                        : AppColors.grayLight600,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '${DateTime.now().year} | Designed by ',
                  style: AppTextStyles.allBody3Normal.copyWith(
                    color: BaseFunctions.isDarkMode(context)
                        ? AppColors.grayDark600
                        : AppColors.grayLight600,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sagar Shah',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          html.window.open(
                            'https://www.figma.com/@shahsagarm',
                            "_blank",
                          );
                          AnalyticsService.logEvent(
                            Constants.sagarShahClicked,
                            {"view": Constants.mobileFooter},
                          );
                        },
                      style: AppTextStyles.allBody3Normal.copyWith(
                        color: BaseFunctions.isDarkMode(context)
                            ? AppColors.grayDark600
                            : AppColors.grayLight600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: ', Developed by ',
                      style: AppTextStyles.allBody3Normal.copyWith(
                        color: BaseFunctions.isDarkMode(context)
                            ? AppColors.grayDark600
                            : AppColors.grayLight600,
                      ),
                    ),
                    TextSpan(
                      text: 'Sardorbek Abdulabbozov',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          html.window.open(linkedinUrl, "_blank");
                          AnalyticsService.logEvent(
                            Constants.linkedinClicked,
                            {"view": Constants.mobileFooter},
                          );
                        },
                      style: AppTextStyles.allBody3Normal.copyWith(
                        color: BaseFunctions.isDarkMode(context)
                            ? AppColors.grayDark600
                            : AppColors.grayLight600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
