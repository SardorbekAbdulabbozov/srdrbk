import 'package:srdrbk/components/widgets/signature_widget.dart';
import 'package:srdrbk/core/analytics/analytics_service.dart';
import 'package:srdrbk/core/constants/constants.dart';
import 'package:srdrbk/main_page/data/model/info.dart';
import 'package:web/web.dart' as html;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key, this.info});

  final Info? info;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final photoSize = size.height - 68 - 96 * 2 - 40;
    return Container(
      width: size.width,
      height: size.height - 68,
      padding: const EdgeInsets.symmetric(horizontal: 112, vertical: 96),
      color: BaseFunctions.isDarkMode(context)
          ? AppColors.grayDarkDefault
          : AppColors.grayLightDefault,
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          'Hi, I’m Sardorbek',
                          style: AppTextStyles.desktopHeading1.copyWith(
                            color: BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark900
                                : AppColors.grayLight900,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      SvgPicture.asset('assets/vectors/wavingHand.svg'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 132),
                    child: Text(
                      info?.about?.replaceAll("***",
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
                          info?.location ?? "",
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
                    padding: EdgeInsets.only(
                      bottom: (info?.isOpenToWork ?? false) ? 48 : 40,
                    ),
                    child: Visibility(
                      visible: info?.isOpenToWork ?? false,
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
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          html.window.open(info?.githubUrl ?? '', "_blank");
                          AnalyticsService.logEvent(
                            Constants.githubClicked,
                            {"view": Constants.desktopGeneral},
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
                            html.window.open(info?.linkedinUrl ?? '', "_blank");
                            AnalyticsService.logEvent(
                              Constants.linkedinClicked,
                              {"view": Constants.desktopGeneral},
                            );
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
                        onPressed: () {
                          html.window.open(info?.telegramUrl ?? "", "_blank");
                          AnalyticsService.logEvent(
                            Constants.telegramClicked,
                            {"view": Constants.desktopGeneral},
                          );
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
                          onPressed: () {
                            html.window.open(info?.xUrl ?? "", "_blank");
                            AnalyticsService.logEvent(
                              Constants.xClicked,
                              {"view": Constants.desktopGeneral},
                            );
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
            ),
          ),
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
                    right: 0,
                    child: Container(
                      color: BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDarkDefault
                          : AppColors.grayLightDefault,
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
                    right: 40,
                    child: Container(
                      color: BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDarkDefault
                          : AppColors.grayLightDefault,
                      width: photoSize * 7 / (8 * 1.5),
                      height: photoSize / 1.5,
                      padding: const EdgeInsets.all(8),
                      child: ColoredBox(
                        color: BaseFunctions.isDarkMode(context)
                            ? AppColors.grayDark200
                            : AppColors.grayLight200,
                        child: CachedNetworkImage(
                          imageUrl: info?.mainPhoto ?? "",
                          fit: BoxFit.cover,
                          errorWidget: (_, __, ___) => const SignatureWidget(),
                          placeholder: (_, __) => const SignatureWidget(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
