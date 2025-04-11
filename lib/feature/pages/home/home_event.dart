import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin class HomeEvent {
  void routeToDepth(WidgetRef ref, WordWithWords words, String depth2) {
    const route = DepthRoute();
    route.updateArg(model: words,depth2: depth2);
    route.push(ref.context);
    return;
  }
}
