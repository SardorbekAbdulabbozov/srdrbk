import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:srdrbk/components/extension/app_extensions.dart';
import 'package:srdrbk/components/global_variables.dart';
import 'package:srdrbk/main_page/data/model/experience.dart';
import 'package:srdrbk/main_page/data/model/project.dart';
import 'package:srdrbk/main_page/data/repository/main_page_repository.dart';

part 'main_page_event.dart';

part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final MainPageRepostiory _landingPageRepostiory;

  MainPageBloc(this._landingPageRepostiory) : super(const MainPageState()) {
    on<ChangeLocale>(_changeLocale);
    on<Initialize>(_initialize);
  }

  Future<void> _initialize(
    Initialize event,
    Emitter<MainPageState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final locale = storageService.getLocale();
    List<Experience> experienceCollection = [];
    List<Project> projectCollection = [];
    String generalInfoContent = "";
    String overviewAboutMe = "";
    List<String> photoCollection = [];

    final experiences = await _landingPageRepostiory.getExperienceCollection();
    experiences.fold(
      (left) {},
      (right) => experienceCollection = right,
    );

    final project = await _landingPageRepostiory.getProjectCollection();
    project.fold(
      (left) {},
      (right) => projectCollection = right,
    );

    final aboutMe = await _landingPageRepostiory.getOverviewAboutMe();
    aboutMe.fold(
      (left) {},
      (right) => overviewAboutMe = right,
    );

    final generalInfo = await _landingPageRepostiory.getGeneralSectionInfo();
    generalInfo.fold(
      (left) {},
      (right) => generalInfoContent = right,
    );

    final images = await _landingPageRepostiory.getImages();
    images.fold(
      (left) {},
      (right) => photoCollection = right,
    );

    emit(
      state.copyWith(
        locale: locale,
        isLoading: false,
        experienceCollection: experienceCollection,
        projectCollection: projectCollection,
        overviewAboutMe: overviewAboutMe,
        generalInfoContent: generalInfoContent,
        mainPhoto: photoCollection.firstIfNotEmpty,
        secondaryPhoto: photoCollection.lastIfNotEmpty,
      ),
    );
  }

  Future<void> _changeLocale(
    ChangeLocale event,
    Emitter<MainPageState> emit,
  ) async {
    emit(state.copyWith(locale: event.locale));
  }
}
