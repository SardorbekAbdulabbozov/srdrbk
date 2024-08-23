import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:srdrbk/components/global_variables.dart';
import 'package:srdrbk/core/api_client/api_client.dart';
import 'package:srdrbk/core/storage/storage.dart';
import 'package:srdrbk/main_page/data/repository/main_page_repository.dart';
import 'package:srdrbk/main_page/data/repository/main_page_repository_impl.dart';

Future<void> setUpDependencies() async {
  injector.registerSingleton<Storage>(await Storage.init());
  injector.registerFactory<FirebaseFirestore>(() => FirebaseFirestore.instance);
  injector.registerSingleton<ApiClient>(
    ApiClient(injector.get<FirebaseFirestore>()),
  );
  _setupRepositories();
}

void _setupRepositories() {
  injector.registerSingleton<MainPageRepostiory>(
    MainPageRepostioryImpl(apiClient: injector.get<ApiClient>()),
  );
}
