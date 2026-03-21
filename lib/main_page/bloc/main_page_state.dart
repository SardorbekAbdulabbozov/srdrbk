part of 'main_page_bloc.dart';

class MainPageState extends Equatable {
  const MainPageState({
    this.locale = 'en',
    this.isLoading = false,
    this.experienceCollection = const [],
    this.projectCollection = const [],
    this.blogCollection = const [],
    this.info,
  });

  final String locale;
  final bool isLoading;
  final List<Experience> experienceCollection;
  final List<Project> projectCollection;
  final List<Blog> blogCollection;
  final Info? info;

  MainPageState copyWith({
    String? locale,
    bool? isLoading,
    List<Experience>? experienceCollection,
    List<Project>? projectCollection,
    List<Blog>? blogCollection,
    Info? info,
  }) {
    return MainPageState(
      locale: locale ?? this.locale,
      isLoading: isLoading ?? this.isLoading,
      experienceCollection: experienceCollection ?? this.experienceCollection,
      projectCollection: projectCollection ?? this.projectCollection,
      blogCollection: blogCollection ?? this.blogCollection,
      info: info ?? this.info,
    );
  }

  @override
  List<Object?> get props => [
        locale,
        isLoading,
        experienceCollection,
        projectCollection,
        blogCollection,
        info,
      ];
}
