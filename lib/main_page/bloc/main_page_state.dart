part of 'main_page_bloc.dart';

class MainPageState extends Equatable {
  const MainPageState({
    this.locale = 'en',
    this.isLoading = false,
    this.experienceCollection = const [],
    this.projectCollection = const [],
    this.info,
  });

  final String locale;
  final bool isLoading;
  final List<Experience> experienceCollection;
  final List<Project> projectCollection;
  final Info? info;

  MainPageState copyWith({
    String? locale,
    bool? isLoading,
    List<Experience>? experienceCollection,
    List<Project>? projectCollection,
    Info? info,
  }) {
    return MainPageState(
      locale: locale ?? this.locale,
      isLoading: isLoading ?? this.isLoading,
      experienceCollection: experienceCollection ?? this.experienceCollection,
      projectCollection: projectCollection ?? this.projectCollection,
      info: info ?? this.info,
    );
  }

  @override
  List<Object?> get props => [
        locale,
        isLoading,
        experienceCollection,
        projectCollection,
        info,
      ];
}
