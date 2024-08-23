part of 'main_page_bloc.dart';

class MainPageState extends Equatable {
  const MainPageState({
    this.currentSectionIndex = 0,
    this.locale = 'en',
    this.isLoading = false,
    this.showRegisterSuccess = false,
    this.experienceCollection = const [],
    this.projectCollection = const [],
    this.overviewAboutMe,
  });

  final int currentSectionIndex;
  final String locale;
  final bool isLoading;
  final bool showRegisterSuccess;
  final List<Experience> experienceCollection;
  final List<Project> projectCollection;
  final String? overviewAboutMe;

  MainPageState copyWith({
    int? currentSectionIndex,
    String? locale,
    bool? isLoading,
    bool? showRegisterSuccess,
    List<Experience>? experienceCollection,
    List<Project>? projectCollection,
    String? overviewAboutMe,
  }) {
    return MainPageState(
      currentSectionIndex: currentSectionIndex ?? this.currentSectionIndex,
      locale: locale ?? this.locale,
      isLoading: isLoading ?? this.isLoading,
      showRegisterSuccess: showRegisterSuccess ?? this.showRegisterSuccess,
      experienceCollection: experienceCollection ?? this.experienceCollection,
      projectCollection: projectCollection ?? this.projectCollection,
      overviewAboutMe: overviewAboutMe ?? this.overviewAboutMe,
    );
  }

  @override
  List<Object?> get props => [
        currentSectionIndex,
        locale,
        isLoading,
        showRegisterSuccess,
        experienceCollection,
        projectCollection,
        overviewAboutMe,
      ];
}
