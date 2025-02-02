import 'package:srdrbk/core/either_dart/either.dart';
import 'package:srdrbk/core/network/failure.dart';
import 'package:srdrbk/main_page/data/model/experience.dart';
import 'package:srdrbk/main_page/data/model/project.dart';

abstract class MainPageRepostiory {
  Future<Either<Failure, List<Experience>>> getExperienceCollection();

  Future<Either<Failure, List<Project>>> getProjectCollection();

  Future<Either<Failure, String>> getOverviewAboutMe();

  Future<Either<Failure, List<String>>> getImages();

  Future<Either<Failure, String>> getGeneralSectionInfo();
}
