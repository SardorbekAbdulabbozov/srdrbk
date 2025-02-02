import 'dart:html' as html;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srdrbk/bloc/app_control_bloc.dart';
import 'package:srdrbk/components/global_variables.dart';
import 'package:srdrbk/components/widgets/action_button.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/config/localization/locale_keys.g.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';
import 'package:srdrbk/main_page/bloc/main_page_bloc.dart';
import 'package:srdrbk/main_page/presentation/desktop_view/sections/about_me_section.dart';
import 'package:srdrbk/main_page/presentation/desktop_view/sections/experience_section.dart';
import 'package:srdrbk/main_page/presentation/desktop_view/sections/footer_section.dart';
import 'package:srdrbk/main_page/presentation/desktop_view/sections/general_section.dart';
import 'package:srdrbk/main_page/presentation/desktop_view/sections/get_in_touch_section.dart';
import 'package:srdrbk/main_page/presentation/desktop_view/sections/projects_section.dart';
import 'package:srdrbk/main_page/presentation/desktop_view/sections/skills_section.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key, required this.state});

  final MainPageState state;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppControlBloc>();
    return Scaffold(
      key: scaffoldKeyDesktop,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  BaseFunctions.scrollTo(
                    desktopGeneralSectionKey.currentContext!,
                  );
                },
                child: Text(
                  '<SA/>',
                  style: AppTextStyles.desktopHeading3Bold.copyWith(
                    color: BaseFunctions.isDarkMode(context)
                        ? AppColors.grayDark900
                        : AppColors.grayLight900,
                  ),
                ),
              ),
              const Spacer(),
              ActionButton(
                onPressed: () {
                  BaseFunctions.scrollTo(
                    desktopAboutMeSectionKey.currentContext!,
                  );
                },
                text: LocaleKeys.about.tr(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ActionButton(
                  onPressed: () {
                    BaseFunctions.scrollTo(
                      desktopProjectsSectionKey.currentContext!,
                    );
                  },
                  text: LocaleKeys.projects.tr(),
                ),
              ),
              ActionButton(
                onPressed: () {
                  BaseFunctions.scrollTo(
                    desktopGetInTouchSectionKey.currentContext!,
                  );
                },
                text: LocaleKeys.contact.tr(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 18),
                child: SizedBox(
                  height: 36,
                  child: VerticalDivider(
                    color: BaseFunctions.isDarkMode(context)
                        ? AppColors.grayDark100
                        : AppColors.grayLight100,
                    width: 2,
                    endIndent: 6,
                    indent: 6,
                  ),
                ),
              ),
              SizedBox(
                width: 36,
                height: 36,
                child: IconButton(
                  onPressed: () async {
                    ThemeMode themeMode;
                    if (BaseFunctions.isDarkMode(context)) {
                      themeMode = ThemeMode.light;
                    } else {
                      themeMode = ThemeMode.dark;
                    }
                    await storageService.setTheme(themeMode);
                    bloc.add(ChangeAppThemeEvent(themeMode: themeMode));
                  },
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.all(6),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  icon: SvgPicture.asset(
                    BaseFunctions.isDarkMode(context)
                        ? 'assets/vectors/light.svg'
                        : 'assets/vectors/dark.svg',
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ElevatedButton(
                  onPressed: () {
                    html.window.open(
                      'https://docs.google.com/document/d/1iDB74YH9u4ThiivFpklfGk73JDnMZuPcC9gIlotBEHo/edit?usp=sharing',
                      "_blank",
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDark900
                          : AppColors.grayLight900,
                    ),
                    overlayColor: MaterialStateProperty.all(
                      BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDark600
                          : AppColors.grayLight600,
                    ),
                  ),
                  child: Text(
                    LocaleKeys.downloadCV.tr(),
                    style: AppTextStyles.allBody2Medium.copyWith(
                      color: BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDark50
                          : AppColors.grayLight50,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: CustomScrollView(
          key: const PageStorageKey<String>('desktop_view'),
          slivers: [
            SliverToBoxAdapter(
              key: desktopGeneralSectionKey,
              child: GeneralSection(
                generalInfo: state.generalInfoContent,
                mainPhoto: state.mainPhoto,
              ),
            ),
            SliverToBoxAdapter(
              key: desktopAboutMeSectionKey,
              child: AboutMeSection(
                aboutMe: state.overviewAboutMe,
                secondaryPhoto: state.secondaryPhoto,
              ),
            ),
            const SliverToBoxAdapter(child: SkillsSection()),
            SliverToBoxAdapter(
              child: ExperienceSection(list: state.experienceCollection),
            ),
            SliverToBoxAdapter(
              key: desktopProjectsSectionKey,
              child: ProjectsSection(list: state.projectCollection),
            ),
            SliverToBoxAdapter(
              key: desktopGetInTouchSectionKey,
              child: const GetInTouchSection(),
            ),
            const SliverToBoxAdapter(child: FooterSection()),
          ],
        ),
      ),
    );
  }
}
