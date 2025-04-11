import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:englishword/core/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin class DepthEvent {
  void routeToDeepDepth(WidgetRef ref, WordWithWords word, String depth2, String depth3) {
    logger.d("routeToDeepDepth>>>>>>>>>>>>>>>>>>>>>>>");
    const route = DeepDepthRoute();
    route.updateArg(model: word, depth2: depth2,depth3: depth3);
    route.push(ref.context);
    return;
  }
}
