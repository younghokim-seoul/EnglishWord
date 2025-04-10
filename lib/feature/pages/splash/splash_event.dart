import 'dart:async';

import 'package:englishword/core/router/router.dart';
import 'package:englishword/feature/pages/splash/provider/splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin class SplashEvent {
  Future<void> initData(WidgetRef ref) async {
    await ref.read(readyWordsProvider.future);
    if(ref.context.mounted){
      const HomeRoute().go(ref.context);
    }
  }
}