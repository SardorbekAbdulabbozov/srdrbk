part of 'main_page_bloc.dart';

class MainPageState extends Equatable {
  const MainPageState({
    this.locale = 'en',
    this.isLoading = false,
    this.experienceCollection = const [],
    this.projectCollection = const [],
    this.overviewAboutMe,
    this.images = const [],
  });

  final String locale;
  final bool isLoading;
  final List<Experience> experienceCollection;
  final List<Project> projectCollection;
  final String? overviewAboutMe;
  final List<String> images;

  MainPageState copyWith({
    String? locale,
    bool? isLoading,
    List<Experience>? experienceCollection,
    List<Project>? projectCollection,
    String? overviewAboutMe,
    List<String>? images,
  }) {
    return MainPageState(
      locale: locale ?? this.locale,
      isLoading: isLoading ?? this.isLoading,
      experienceCollection: experienceCollection ?? this.experienceCollection,
      projectCollection: projectCollection ?? this.projectCollection,
      overviewAboutMe: overviewAboutMe ?? this.overviewAboutMe,
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props => [
        locale,
        isLoading,
        experienceCollection,
        projectCollection,
        overviewAboutMe,
        images,
      ];
}
