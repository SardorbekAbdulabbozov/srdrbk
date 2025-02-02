import 'package:flutter/foundation.dart';
import 'package:srdrbk/components/extension/app_extensions.dart';
import 'package:srdrbk/core/api_client/api_client.dart';
import 'package:srdrbk/core/constants/constants.dart';
import 'package:srdrbk/core/either_dart/either.dart';
import 'package:srdrbk/core/network/failure.dart';
import 'package:srdrbk/main_page/data/model/experience.dart';
import 'package:srdrbk/main_page/data/model/project.dart';
import 'package:srdrbk/main_page/data/repository/main_page_repository.dart';

class MainPageRepostioryImpl extends MainPageRepostiory {
  final ApiClient _apiClient;

  MainPageRepostioryImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<Either<Failure, List<Experience>>> getExperienceCollection() async {
    try {
      final response = await _apiClient.firestore
          .collection(Constants.experienceCollection)
          .orderBy('order', descending: true)
          .get();
      List<Experience> experienceCollection = [];
      for (var element in response.docs) {
        experienceCollection.add(Experience.fromJson(element.data()));
      }
      return Right(experienceCollection);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getProjectCollection() async {
    try {
      final response = await _apiClient.firestore
          .collection(Constants.projectCollection)
          .orderBy('order', descending: false)
          .get();
      List<Project> projectCollection = [];
      for (var element in response.docs) {
        projectCollection.add(Project.fromJson(element.data()));
      }
      return Right(projectCollection);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getOverviewAboutMe() async {
    try {
      final response = await _apiClient.firestore
          .collection(Constants.aboutMeCollection)
          .get();
      if (response.docs.isNotEmpty) {
        return Right(response.docs.firstIfNotEmpty?["aboutMe"] ?? '');
      } else {
        return const Left(ServerFailure(message: "No data found"));
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getImages() async {
    try {
      final response = await _apiClient.firestore
          .collection(Constants.photoCollection)
          .get();
      List<String> images = [];
      if (response.docs.isNotEmpty) {
        final mainPhoto =
            response.docs.firstIfNotEmpty?.data()["mainPhoto"] ?? "";
        final secondaryPhoto =
            response.docs.firstIfNotEmpty?.data()["secondaryPhoto"] ?? "";
        images.add(mainPhoto);
        images.add(secondaryPhoto);
        return Right(images);
      } else {
        return const Left(ServerFailure(message: "No data found"));
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<void> createList() async {
    List<Experience> lists = [];
    for (Experience element in lists) {
      final response = await _apiClient.firestore
          .collection(Constants.experienceCollection)
          .add(element.toJson());
      debugPrint(response.id);
    }
  }

  Future<void> createSingle() async {
    Experience experience = Experience();
    final response = await _apiClient.firestore
        .collection(Constants.experienceCollection)
        .add(experience.toJson());
    debugPrint(response.id);
  }

  @override
  Future<Either<Failure, String>> getGeneralSectionInfo() async {
    try {
      final response = await _apiClient.firestore
          .collection(Constants.generalCollection)
          .get();
      String generalInfo = "";
      for (var element in response.docs) {
        generalInfo = element.data()['info'] ?? '';
      }
      return Right(generalInfo);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
