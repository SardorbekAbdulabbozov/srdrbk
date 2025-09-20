import 'package:srdrbk/components/global_variables.dart';
import 'package:srdrbk/core/api_client/api_client.dart';
import 'package:srdrbk/core/storage/storage.dart';
import 'package:srdrbk/main_page/data/repository/main_page_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> setUpDependencies() async {
  injector.registerSingleton<Storage>(await Storage.init());
  injector.registerFactory<SupabaseClient>(() => Supabase.instance.client);
  injector.registerSingleton<ApiClient>(
    ApiClient(injector.get<SupabaseClient>()),
  );
  _setupRepositories();
}

void _setupRepositories() {
  injector.registerSingleton<MainPageRepostiory>(
    MainPageRepostioryImpl(apiClient: injector.get<ApiClient>()),
  );
}
