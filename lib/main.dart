import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srdrbk/bloc/app_control_bloc.dart';
import 'package:srdrbk/components/global_variables.dart';
import 'package:srdrbk/core/config/router/router.dart';
import 'package:srdrbk/core/dependency/dependency_injection.dart';
import 'package:srdrbk/core/theme/theme.dart';
import 'package:srdrbk/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  await EasyLocalization.ensureInitialized();
  await setUpDependencies();
  await storageService.setTheme(ThemeMode.system);
  runApp(
    EasyLocalization(
      path: 'lib/core/config/localization',
      supportedLocales: const [Locale("en"), Locale("uz")],
      fallbackLocale: const Locale("en"),
      startLocale: Locale(storageService.getLocale()),
      child: const SrdrbksApp(),
    ),
  );
}

class SrdrbksApp extends StatelessWidget {
  const SrdrbksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppControlBloc(),
      child: BlocBuilder<AppControlBloc, AppControlState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Sardorbek Abdulabbozov',
            scaffoldMessengerKey: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: state.themeMode,
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
