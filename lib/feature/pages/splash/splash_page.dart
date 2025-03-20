import 'package:englishword/core/constants/assets.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/feature/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends BasePage {
  const SplashPage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    logger.d("SplashPage buildPage");
    return Center(
      child: Image.asset(Assets.splash , width: 233, height: 233),
    );
  }

  @override
  Color? get screenBackgroundColor => AppColor.of.yellow1;
}