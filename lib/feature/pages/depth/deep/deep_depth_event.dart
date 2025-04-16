import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:englishword/core/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin class DeepDepthEvent {
  void routeToExampleDepth(WidgetRef ref, String word, int seq) {
    const route = ExampleDepthRoute();
    route.updateArg(exampleWord: word, exampleSeq: seq);
    route.push(ref.context);
    return;
  }
}
