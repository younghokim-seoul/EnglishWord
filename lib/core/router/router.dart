import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/feature/pages/depth/deep/deep_depth_page.dart';
import 'package:englishword/feature/pages/depth/depth_page.dart';
import 'package:englishword/feature/pages/depth/provider/depth_route_arg.dart';
import 'package:englishword/feature/pages/home/home_page.dart';
import 'package:englishword/feature/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter appRouter(WidgetRef ref) => GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  initialLocation: SplashRoute.path,
  routes: $appRoutes,
);

@TypedGoRoute<SplashRoute>(path: SplashRoute.path, name: SplashRoute.name)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  static const String path = '/splash';
  static const String name = 'splash';

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: Tween(begin: 1.0, end: 0.0).animate(secondaryAnimation),
          child: child,
        );
      },
      child: const SplashPage(),
    );
  }
}

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
  name: HomeRoute.name,
  routes: [
    TypedGoRoute<DepthRoute>(path: DepthRoute.path, name: DepthRoute.name),
    TypedGoRoute<DeepDepthRoute>(path: DeepDepthRoute.path, name: DeepDepthRoute.name),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const String path = '/';
  static const String name = 'home';

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: Tween(begin: 1.0, end: 0.0).animate(secondaryAnimation),
          child: child,
        );
      },
      child: const HomePage(),
    );
  }
}

class DepthRoute extends GoRouteData {
  const DepthRoute();

  static const String path = 'depth';
  static const String name = 'depth';

  static late DepthRouteArg arg;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      fullscreenDialog: true,
      transitionsBuilder: (_, animation, __, child) {
        var begin = const Offset(1.0, 0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
      child: const DepthPage(),
    );
  }

  void updateArg({required WordWithWords model}) {
    arg = (model: model);
  }
}

class DeepDepthRoute extends GoRouteData {
  const DeepDepthRoute();

  static const String path = 'deep_depth';
  static const String name = 'deep_depth';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      fullscreenDialog: true,
      transitionsBuilder: (_, animation, __, child) {
        var begin = const Offset(1.0, 0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
      child: const DeepDepthPage(),
    );
  }
}
