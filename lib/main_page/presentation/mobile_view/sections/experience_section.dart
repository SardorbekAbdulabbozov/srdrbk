import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/config/localization/locale_keys.g.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';
import 'package:srdrbk/main_page/data/model/experience.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key, required this.list});

  final List<Experience> list;

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
              LocaleKeys.experience.tr(),
              style: AppTextStyles.allBody3Medium.copyWith(
                color: BaseFunctions.isDarkMode(context)
                    ? AppColors.grayDark600
                    : AppColors.grayLight600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: Text(
              LocaleKeys.experienceDescription.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.mobileTabletSubtitleNormal.copyWith(
                color: BaseFunctions.isDarkMode(context)
                    ? AppColors.grayDark600
                    : AppColors.grayLight600,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, i) {
              return Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: BaseFunctions.isDarkMode(context)
                      ? AppColors.grayDark100
                      : AppColors.grayLight100,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (list[i].companyLogo != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/${list[i].companyLogo}',
                            width: 64,
                            height: 64,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        list[i].duration ?? "",
                        style: AppTextStyles.allBody2Normal.copyWith(
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark700
                              : AppColors.grayLight700,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          list[i].position ?? "",
                          style: AppTextStyles.mobileTabletSubtitleSemiBold
                              .copyWith(
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
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              list[i].responsibilities!,
                              style: AppTextStyles.allBody2Normal.copyWith(
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
            },
            separatorBuilder: (_, __) => const SizedBox(height: 24),
          ),
        ],
      ),
    );
  }
}
