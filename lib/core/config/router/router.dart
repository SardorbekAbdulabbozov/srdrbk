import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:srdrbk/components/global_variables.dart';
import 'package:srdrbk/main_page/bloc/main_page_bloc.dart';
import 'package:srdrbk/main_page/data/repository/main_page_repository.dart';
import 'package:srdrbk/main_page/presentation/main_page.dart';

final GoRouter router = GoRouter(
  navigatorKey: rootKey,
  initialLocation: MainPage.routeName,
  observers: [GoRouterObserver()],
  routes: <RouteBase>[
    GoRoute(
      path: MainPage.routeName,
      name: MainPage.routeName,
      parentNavigatorKey: rootKey,
      builder: (context, state) => BlocProvider(
        create: (context) {
          return MainPageBloc(injector.get<MainPageRepostiory>())
            ..add(const Initialize());
        },
        child: const MainPage(),
      ),
    ),
  ],
);

class GoRouterObserver extends NavigatorObserver {
  String routeName = '';

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('${route.settings.name}', name: "didPush");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('${route.settings.name}', name: "didPop");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('${route.settings.name}', name: "didRemove");
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    log('${newRoute?.settings.name}', name: "didReplace");
  }
}
