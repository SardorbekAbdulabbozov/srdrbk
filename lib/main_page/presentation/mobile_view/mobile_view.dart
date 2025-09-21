import 'package:srdrbk/core/analytics/analytics_service.dart';
import 'package:srdrbk/core/constants/constants.dart';
import 'package:web/web.dart' as html;
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
import 'package:srdrbk/main_page/presentation/mobile_view/sections/about_me_section.dart';
import 'package:srdrbk/main_page/presentation/mobile_view/sections/experience_section.dart';
import 'package:srdrbk/main_page/presentation/mobile_view/sections/footer_section.dart';
import 'package:srdrbk/main_page/presentation/mobile_view/sections/general_section.dart';
import 'package:srdrbk/main_page/presentation/mobile_view/sections/get_in_touch_section.dart';
import 'package:srdrbk/main_page/presentation/mobile_view/sections/projects_section.dart';
import 'package:srdrbk/main_page/presentation/mobile_view/sections/skills_section.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key, required this.state});

  final MainPageState state;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppControlBloc>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKeyMobile,
      endDrawer: Drawer(
        width: size.width,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 68,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        BaseFunctions.scrollTo(
                          mobileGeneralSectionKey.currentContext!,
                        );
                        scaffoldKeyMobile.currentState?.closeEndDrawer();
                        AnalyticsService.logEvent(
                          Constants.generalClicked,
                          {"view": Constants.mobileDrawerView},
                        );
                      },
                      child: Text(
                        '<SA/>',
                        style: AppTextStyles.mobileTabletHeading3Bold.copyWith(
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark900
                              : AppColors.grayLight900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: IconButton(
                        onPressed: () =>
                            scaffoldKeyMobile.currentState?.closeEndDrawer(),
                        icon: Icon(
                          Icons.close_rounded,
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark600
                              : AppColors.grayLight600,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 0,
              thickness: 1,
              color: BaseFunctions.isDarkMode(context)
                  ? AppColors.grayDark100
                  : AppColors.grayLight100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: ActionButton(
                isMobileView: true,
                onPressed: () {
                  BaseFunctions.scrollTo(
                    mobileAboutMeSectionKey.currentContext!,
                  );
                  AnalyticsService.logEvent(
                    Constants.aboutClicked,
                    {"view": Constants.mobileDrawerView},
                  );
                  scaffoldKeyMobile.currentState?.closeEndDrawer();
                },
                text: LocaleKeys.about.tr(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ActionButton(
                isMobileView: true,
                onPressed: () {
                  BaseFunctions.scrollTo(
                    mobileProjectsSectionKey.currentContext!,
                  );
                  AnalyticsService.logEvent(
                    Constants.projectsClicked,
                    {"view": Constants.mobileDrawerView},
                  );
                  scaffoldKeyMobile.currentState?.closeEndDrawer();
                },
                text: LocaleKeys.projects.tr(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: ActionButton(
                isMobileView: true,
                onPressed: () {
                  BaseFunctions.scrollTo(
                    mobileGetInTouchSectionKey.currentContext!,
                  );
                  AnalyticsService.logEvent(
                    Constants.contactClicked,
                    {"view": Constants.mobileDrawerView},
                  );
                  scaffoldKeyMobile.currentState?.closeEndDrawer();
                },
                text: LocaleKeys.contact.tr(),
              ),
            ),
            Divider(
              height: 0,
              thickness: 1,
              color: BaseFunctions.isDarkMode(context)
                  ? AppColors.grayDark100
                  : AppColors.grayLight100,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(8, 16, 16, 16),
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () async {
                  ThemeMode themeMode;
                  if (BaseFunctions.isDarkMode(context)) {
                    themeMode = ThemeMode.light;
                  } else {
                    themeMode = ThemeMode.dark;
                  }
                  await storageService.setTheme(themeMode);
                  bloc.add(ChangeAppThemeEvent(themeMode: themeMode));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6)
                          .copyWith(left: 8),
                      child: Text(
                        'Switch Theme',
                        style: AppTextStyles.allBody2Normal.copyWith(
                          color: BaseFunctions.isDarkMode(context)
                              ? AppColors.grayDark600
                              : AppColors.grayLight600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: SvgPicture.asset(
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
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    html.window.open(state.info?.cvUrl ?? "", "_blank");
                    AnalyticsService.logEvent(
                      Constants.cvClicked,
                      {"view": Constants.mobileDrawerView},
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      BaseFunctions.isDarkMode(context)
                          ? AppColors.grayDark900
                          : AppColors.grayLight900,
                    ),
                    overlayColor: WidgetStatePropertyAll(
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
            ),
          ],
        ),
      ),
      appBar: AppBar(
        titleSpacing: 16,
        centerTitle: false,
        title: GestureDetector(
          onTap: () {
            BaseFunctions.scrollTo(
              mobileGeneralSectionKey.currentContext!,
            );
            AnalyticsService.logEvent(
              Constants.generalClicked,
              {"view": Constants.mobileAppBarView},
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () => scaffoldKeyMobile.currentState?.openEndDrawer(),
              icon: SvgPicture.asset(
                'assets/vectors/menu.svg',
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
        ],
      ),
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: CustomScrollView(
          key: const PageStorageKey<String>('mobile_view'),
          slivers: [
            SliverToBoxAdapter(
              key: mobileGeneralSectionKey,
              child: GeneralSection(info: state.info),
            ),
            SliverToBoxAdapter(
              key: mobileAboutMeSectionKey,
              child: AboutMeSection(
                aboutMe: state.info?.overview,
                secondaryPhoto: state.info?.secondaryPhoto,
              ),
            ),
            const SliverToBoxAdapter(child: SkillsSection()),
            SliverToBoxAdapter(
              child: ExperienceSection(list: state.experienceCollection),
            ),
            SliverToBoxAdapter(
              key: mobileProjectsSectionKey,
              child: ProjectsSection(list: state.projectCollection),
            ),
            SliverToBoxAdapter(
              key: mobileGetInTouchSectionKey,
              child: GetInTouchSection(info: state.info),
            ),
            SliverToBoxAdapter(
              child: FooterSection(linkedinUrl: state.info?.linkedinUrl ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}
