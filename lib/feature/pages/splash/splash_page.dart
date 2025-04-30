import 'package:englishword/core/constants/assets.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/feature/base/base_page.dart';
import 'package:englishword/feature/pages/splash/splash_event.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends BasePage with SplashEvent {
  const SplashPage({super.key});

  @override
  void onInit(WidgetRef ref) => initData(ref);
  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    return Center(child: Image.asset(Assets.splash, width: 233, height: 233));
  }

  @override
  Color? get screenBackgroundColor => AppColor.of.yellow1;
}