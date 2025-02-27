part of 'main_page_bloc.dart';

class MainPageState extends Equatable {
  const MainPageState({
    this.locale = 'en',
    this.isLoading = false,
    this.experienceCollection = const [],
    this.projectCollection = const [],
    this.overviewAboutMe,
    this.mainPhoto,
    this.secondaryPhoto,
    this.generalInfoContent,
  });

  final String locale;
  final bool isLoading;
  final List<Experience> experienceCollection;
  final List<Project> projectCollection;
  final String? overviewAboutMe;
  final String? mainPhoto;
  final String? secondaryPhoto;
  final String? generalInfoContent;

  MainPageState copyWith({
    String? locale,
    bool? isLoading,
    List<Experience>? experienceCollection,
    List<Project>? projectCollection,
    String? overviewAboutMe,
    String? mainPhoto,
    String? secondaryPhoto,
    String? generalInfoContent,
  }) {
    return MainPageState(
      locale: locale ?? this.locale,
      isLoading: isLoading ?? this.isLoading,
      experienceCollection: experienceCollection ?? this.experienceCollection,
      projectCollection: projectCollection ?? this.projectCollection,
      overviewAboutMe: overviewAboutMe ?? this.overviewAboutMe,
      mainPhoto: mainPhoto ?? this.mainPhoto,
      secondaryPhoto: secondaryPhoto ?? this.secondaryPhoto,
      generalInfoContent: generalInfoContent ?? this.generalInfoContent,
    );
  }

  @override
  List<Object?> get props => [
        locale,
        isLoading,
        experienceCollection,
        projectCollection,
        overviewAboutMe,
        mainPhoto,
        secondaryPhoto,
        generalInfoContent,
      ];
}
