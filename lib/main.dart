import 'package:englishword/core/di/app_modules.dart';
import 'package:englishword/core/router/router.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/core/style/app_size.dart';
import 'package:englishword/core/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppModules.init();
  runApp(
    ProviderScope(
      parent: globalContainer,
      observers: [MyObserver()],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  App({super.key}) {
    _initLoadingIndicator();
  }

  static void _initLoadingIndicator() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.transparent
      ..boxShadow = []
      ..indicatorColor = Colors.white
      ..maskType = EasyLoadingMaskType.black
      ..maskColor = Colors.transparent
      ..textColor = Colors.white
      ..dismissOnTap = false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return Consumer(
      builder: (context, ref, child) {
        final router = appRouter(ref);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          themeMode: ThemeMode.light,
          title: '테마 영어 단어',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          builder: EasyLoading.init(
            builder: (context, child) {
              AppColor.init(context);
              AppSize.init(context);
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600 &&
                      AppSize.originScreenWidth > 600) {
                    // 태블릿 디바이스일 경우
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          color: Colors.black, // 검정색 배경
                        ),
                        Center(
                          child: SizedBox(
                            width: 375, // 가운데 화면의 너비
                            height: 812, // 가운데 화면의 높이
                            child: child,
                          ),
                        ),
                      ],
                    );
                  }
                  return child!;
                },
              );
            },
          ),
        );
      },
    );
  }
}

final globalContainer = ProviderContainer();

class MyObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    print('Provider $provider was initialized with $value');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    print('Provider $provider was disposed');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('Provider $provider updated from $previousValue to $newValue');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    print('Provider $provider threw $error at $stackTrace');
  }
}
