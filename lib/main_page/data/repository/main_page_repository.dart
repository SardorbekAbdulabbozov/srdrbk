import 'package:flutter/material.dart';
import 'package:srdrbk/core/api_client/api_client.dart';
import 'package:srdrbk/core/constants/constants.dart';
import 'package:srdrbk/core/either_dart/either.dart';
import 'package:srdrbk/core/network/failure.dart';
import 'package:srdrbk/main_page/data/model/experience.dart';
import 'package:srdrbk/main_page/data/model/info.dart';
import 'package:srdrbk/main_page/data/model/project.dart';

part "main_page_repository_impl.dart";

abstract class MainPageRepostiory {
  Future<Either<Failure, List<Experience>>> getExperienceCollection();

  Future<Either<Failure, List<Project>>> getProjectCollection();

  Future<Either<Failure, Info>> getOverviewAboutMe();
}
