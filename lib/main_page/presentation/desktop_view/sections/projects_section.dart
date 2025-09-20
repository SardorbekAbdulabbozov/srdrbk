import 'package:cached_network_image/cached_network_image.dart';
import 'package:web/web.dart' as html;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/config/localization/locale_keys.g.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';
import 'package:srdrbk/main_page/data/model/project.dart';
import 'package:srdrbk/components/widgets/signature_widget.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.list});

  final List<Project> list;

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
        children: [
          Chip(
            label: Text(
              LocaleKeys.projects.tr(),
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
              LocaleKeys.projectsDescription.tr(),
              style: AppTextStyles.desktopSubtitleNormal.copyWith(
                color: BaseFunctions.isDarkMode(context)
                    ? AppColors.grayDark600
                    : AppColors.grayLight600,
              ),
            ),
          ),
          ListView.separated(
            itemCount: list.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height:
                          384 * ((size.width - 112 * 2) / 2 - 48 * 2) / 480 +
                              48 * 2,
                      padding: const EdgeInsets.all(48),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        color: i % 2 == 0
                            ? BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark200
                                : AppColors.grayLight200
                            : BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark100
                                : AppColors.grayLight100,
                      ),
                      child: i % 2 == 0
                          ? getImage(i, context)
                          : getInfo(i, context),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height:
                          384 * ((size.width - 112 * 2) / 2 - 48 * 2) / 480 +
                              48 * 2,
                      padding: const EdgeInsets.all(48),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: i % 2 == 0
                            ? BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark100
                                : AppColors.grayLight100
                            : BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark200
                                : AppColors.grayLight200,
                      ),
                      child: i % 2 == 0
                          ? getInfo(i, context)
                          : getImage(i, context),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 48),
          ),
        ],
      ),
    );
  }

  Widget getImage(int i, BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: list[i].image ?? "",
        width: (size.width - 112 * 2) / 2 - 48 * 2,
        height: 384 * ((size.width - 112 * 2) / 2 - 48 * 2) / 480,
        errorWidget: (_, __, ___) => const SignatureWidget(),
        placeholder: (_, __) => const SignatureWidget(),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget getInfo(int i, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            list[i].title ?? "",
            style: AppTextStyles.desktopSubtitleSemiBold.copyWith(
              color: BaseFunctions.isDarkMode(context)
                  ? AppColors.grayDark900
                  : AppColors.grayLight900,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              list[i].description ?? "",
              style: AppTextStyles.allBody2Normal.copyWith(
                color: BaseFunctions.isDarkMode(context)
                    ? AppColors.grayDark600
                    : AppColors.grayLight600,
              ),
            ),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              list[i].technologiesUsed?.length ?? 0,
              (index) {
                return Chip(
                  padding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 20,
                  ),
                  backgroundColor: BaseFunctions.isDarkMode(context)
                      ? AppColors.grayDark200
                      : AppColors.grayLight200,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  label: Text(
                    list[i].technologiesUsed?[index] ?? '',
                    style: AppTextStyles.allBody3Medium.copyWith(
                      color: BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDark600
                          : AppColors.grayLight600,
                    ),
                  ),
                );
              },
            ),
          ),
          Visibility(
            visible: (list[i].link ?? '').isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: IconButton(
                onPressed: () {
                  html.window.open(
                    list[i].link ?? '',
                    "_blank",
                  );
                },
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.all(6),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    BaseFunctions.isDarkMode(context)
                        ? AppColors.grayDark100
                        : AppColors.grayLight100,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                icon: SvgPicture.asset(
                  'assets/vectors/share.svg',
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
            ),
          ),
        ],
      ),
    );
  }
}
