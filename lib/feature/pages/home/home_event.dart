import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/router/router.dart';
import 'package:englishword/feature/pages/depth/provider/selected_depth_word_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin class HomeEvent {
  void routeToDepth(WidgetRef ref, WordWithWords words, String targetWord) {
    ref.read(selectedDepthWordProviderProvider.notifier)
      ..removeAllDepth()
      ..addDepth(targetWord);
    const route = DepthRoute();
    route.updateArg(model: words);
    route.go(ref.context);
    return;
  }
}
