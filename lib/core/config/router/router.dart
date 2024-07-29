import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manfaa/components/global_variables.dart';
import 'package:manfaa/core/dependency/dependency_injection.dart';
import 'package:manfaa/features/landing_page/bloc/landing_page_bloc.dart';
import 'package:manfaa/features/landing_page/data/repository/landing_page_repository.dart';
import 'package:manfaa/features/landing_page/presentation/landing_page.dart';

final GoRouter router = GoRouter(
  navigatorKey: rootKey,
  initialLocation: LandingPage.routeName,
  observers: [GoRouterObserver()],
  routes: <RouteBase>[
    GoRoute(
      path: LandingPage.routeName,
      name: LandingPage.routeName,
      parentNavigatorKey: rootKey,
      builder: (context, state) => BlocProvider(
        create: (context) {
          return LandingPageBloc(injector.get<LandingPageRepostiory>());
        },
        child: const LandingPage(),
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
