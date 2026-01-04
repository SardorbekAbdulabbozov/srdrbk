import 'package:srdrbk/core/analytics/analytics_service.dart';
import 'package:srdrbk/core/constants/constants.dart';
import 'package:srdrbk/main_page/data/model/info.dart';
import 'package:web/web.dart' as html;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';
import 'dart:math' as math;

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key, this.info});

  final Info? info;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final photoSize = size.height - 68 - 96 * 2 - 40;
    return SizedBox(
      width: size.width,
      height: size.height - 68,
      child: Stack(
        children: [
          const PortfolioBackground(),
          Container(
            width: size.width,
            height: size.height - 68,
            padding: const EdgeInsets.symmetric(horizontal: 112, vertical: 96),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Hi, I'm ",
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          // Ensure this is in pubspec
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -1,
                        ),
                      ),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color(0xFF6366F1), // Primary
                            Color(0xFFA855F7), // Secondary
                          ],
                        ).createShader(Rect.fromLTWH(
                            -5, 0, bounds.width + 10, bounds.height)),
                        child: Text(
                          'Sardorbek',
                          style: const TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1,
                              color: Color(0xFFA855F7)),
                        ),
                      ),
                    ],
                  ),
                  // Text(
                  //   'Hi, I’m Sardorbek',
                  //   style: AppTextStyles.desktopHeading1.copyWith(
                  //     color: BaseFunctions.isDarkMode(context)
                  //         ? AppColors.grayDark900
                  //         : AppColors.grayLight900,
                  //   ),
                  //   overflow: TextOverflow.ellipsis,
                  //   maxLines: 2,
                  // ),
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
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 48),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
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
                        mainAxisSize: MainAxisSize.min,
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
                    mainAxisSize: MainAxisSize.min,
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
        ],
      ),
    );
  }
}

class PortfolioBackground extends StatefulWidget {
  const PortfolioBackground({super.key});

  @override
  State<PortfolioBackground> createState() => _PortfolioBackgroundState();
}

class _PortfolioBackgroundState extends State<PortfolioBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 7), // Matches your 'blob 7s infinite'
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Dark Base Layer (Slate 900)
        Positioned.fill(child: Container(color: const Color(0xFF0F172A))),

        // Radial Gradient Overlay
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1.5,
                colors: [
                  Color(0xFF1E293B), // Lighter slate for the top glow
                  Color(0xFF0F172A), // Indigo 500 / Dark base
                  Colors.black,
                ],
                stops: [0.0, 0.4, 1.0],
              ),
            ),
          ),
        ),

        // Animated Blobs using your Keyframe Logic
        _Blob(
          controller: _controller,
          top: -100,
          left: -50,
          color: const Color(0xFF6366F1).withOpacity(0.15),
          // Primary
          delay: 0,
        ),
        _Blob(
          controller: _controller,
          top: 200,
          right: -50,
          color: const Color(0xFFA855F7).withOpacity(0.15),
          // Secondary
          delay: 2.3, // Roughly 33% of 7s
        ),

        // Grain Overlay (Optional - remove if not needed)
        // Positioned.fill(
        //   child: Opacity(
        //     opacity: 0.03,
        //     child: Image.network(
        //       'https://www.transparenttextures.com/patterns/stardust.png',
        //       repeat: ImageRepeat.repeat,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class _Blob extends StatelessWidget {
  final AnimationController controller;
  final double? top, left, right, bottom;
  final Color color;
  final double delay;

  const _Blob(
      {required this.controller,
      this.top,
      this.left,
      this.right,
      this.bottom,
      required this.color,
      required this.delay});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // Simulating the 0% -> 33% -> 66% keyframes
        double t = (controller.value + delay) % 1.0;
        double x = math.sin(t * 2 * math.pi) * 30;
        double y = math.cos(t * 2 * math.pi) * 50;
        double scale = 1.0 + (math.sin(t * 2 * math.pi) * 0.1);

        return Positioned(
          top: top != null ? top! + y : null,
          left: left != null ? left! + x : null,
          right: right != null ? right! - x : null,
          bottom: bottom != null ? bottom! - y : null,
          child: Transform.scale(
            scale: scale,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color,
                    blurRadius: 120,
                    spreadRadius: 40,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
