import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/config/localization/locale_keys.g.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';
import 'package:srdrbk/main_page/data/model/experience.dart';
import 'package:srdrbk/components/widgets/signature_widget.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key, required this.list});

  final List<Experience> list;

  @override
  Widget build(BuildContext context) {
    List<String> responsibilitiesBullets = [];
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
              LocaleKeys.experience.tr(),
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
              LocaleKeys.experienceDescription.tr(),
              style: AppTextStyles.desktopSubtitleNormal.copyWith(
                color: BaseFunctions.isDarkMode(context)
                    ? AppColors.grayDark600
                    : AppColors.grayLight600,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: list.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              if (list[i].responsibilities != null) {
                responsibilitiesBullets =
                    list[i].responsibilities!.split('###');
              }
              return Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: BaseFunctions.isDarkMode(context)
                      ? AppColors.grayDark100
                      : AppColors.grayLight100,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (list[i].companyLogo != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 152),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: BaseFunctions.isDarkMode(context)
                                ? AppColors.grayDark50
                                : AppColors.grayLight50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: list[i].companyLogo ?? "",
                            width: 64,
                            height: 64,
                            errorWidget: (_, __, ___) =>
                                const SignatureWidget(),
                            placeholder: (_, __) => const SignatureWidget(),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[i].position ?? "",
                            style:
                                AppTextStyles.desktopSubtitleSemiBold.copyWith(
                              color: BaseFunctions.isDarkMode(context)
                                  ? AppColors.grayDark900
                                  : AppColors.grayLight900,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              list[i].employmentType ?? "",
                              style: AppTextStyles.allBody3Medium.copyWith(
                                color: BaseFunctions.isDarkMode(context)
                                    ? AppColors.grayDark600
                                    : AppColors.grayLight600,
                              ),
                            ),
                          ),
                          if (list[i].responsibilities != null)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, right: 48),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  responsibilitiesBullets.length,
                                  (index) {
                                    return Text(
                                      "• ${responsibilitiesBullets[index]}",
                                      style:
                                          AppTextStyles.allBody2Normal.copyWith(
                                        color: BaseFunctions.isDarkMode(context)
                                            ? AppColors.grayDark600
                                            : AppColors.grayLight600,
                                        // overflow: TextOverflow.ellipsis
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Text(
                      list[i].duration ?? "",
                      style: AppTextStyles.allBody2Normal.copyWith(
                        color: BaseFunctions.isDarkMode(context)
                            ? AppColors.grayDark700
                            : AppColors.grayLight700,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 48),
          ),
        ],
      ),
    );
  }
}
