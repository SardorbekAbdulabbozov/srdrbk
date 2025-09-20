part of "main_page_repository.dart";

class MainPageRepostioryImpl extends MainPageRepostiory {
  final ApiClient _apiClient;

  MainPageRepostioryImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<Either<Failure, List<Experience>>> getExperienceCollection() async {
    try {
      final response = await _apiClient.supabaseClient
          .from(Constants.experience)
          .select()
          .order("order", ascending: true);
      List<Experience> experienceCollection = [];
      for (var element in response) {
        experienceCollection.add(Experience.fromJson(element));
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
      final response = await _apiClient.supabaseClient
          .from(Constants.project)
          .select()
          .order("order", ascending: true);
      List<Project> projectCollection = [];
      for (var element in response) {
        projectCollection.add(Project.fromJson(element));
      }
      return Right(projectCollection);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Info>> getOverviewAboutMe() async {
    try {
      final response =
          await _apiClient.supabaseClient.from(Constants.info).select();
      if (response.isNotEmpty) {
        return Right(Info.fromJson(response.first));
      } else {
        return const Left(ServerFailure(message: ''));
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
