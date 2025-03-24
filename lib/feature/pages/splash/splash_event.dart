import 'dart:async';

import 'package:englishword/core/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin class SplashEvent {
  Future<void> initData(WidgetRef ref) async {
    await Future.delayed(const Duration(seconds: 2));

    if(ref.context.mounted){
      const HomeRoute().go(ref.context);
    }
  }
}