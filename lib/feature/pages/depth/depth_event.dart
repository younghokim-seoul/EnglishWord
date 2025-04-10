import 'package:englishword/core/router/router.dart';
import 'package:englishword/feature/pages/depth/provider/selected_depth_word_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin class DepthEvent {
  void routeToDeepDepth(WidgetRef ref,String targetWord) {
    ref.read(selectedDepthWordProviderProvider.notifier).addDepth(targetWord);
    const route = DeepDepthRoute();
    route.go(ref.context);
    return;
  }
}
