// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $homeRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      name: 'splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      name: 'home',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'depth',
          name: 'depth',
          factory: $DepthRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'deep_depth',
          name: 'deep_depth',
          factory: $DeepDepthRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'example_depth',
          name: 'example_depth',
          factory: $ExampleDepthRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'my_word',
          name: 'my_word',
          factory: $MyWordRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DepthRouteExtension on DepthRoute {
  static DepthRoute _fromState(GoRouterState state) => const DepthRoute();

  String get location => GoRouteData.$location(
        '/depth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DeepDepthRouteExtension on DeepDepthRoute {
  static DeepDepthRoute _fromState(GoRouterState state) =>
      const DeepDepthRoute();

  String get location => GoRouteData.$location(
        '/deep_depth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ExampleDepthRouteExtension on ExampleDepthRoute {
  static ExampleDepthRoute _fromState(GoRouterState state) =>
      const ExampleDepthRoute();

  String get location => GoRouteData.$location(
        '/example_depth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MyWordRouteExtension on MyWordRoute {
  static MyWordRoute _fromState(GoRouterState state) => const MyWordRoute();

  String get location => GoRouteData.$location(
        '/my_word',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
