import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/feature/pages/depth/provider/deep_depth_route_arg.dart';
import 'package:englishword/feature/pages/depth/provider/deep_word_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' show WidgetRef;
import 'package:riverpod_annotation/riverpod_annotation.dart';

mixin class DeepDepthState {
  DeepDepthRouteArg arg(WidgetRef ref) => ref.watch(deepDepthRouteArgProvider);

  List<String> getDeepDepthHeader(WidgetRef ref) {
    final depth = [arg(ref).depth2, arg(ref).depth3];
    final header = arg(ref).model.word;

    return [header, ...depth];
  }

  AsyncValue<DeepWordWithWords?> getDeepWordWithWords(WidgetRef ref) {
    return ref.watch(deepWordProviderProvider(arg(ref).depth3));
  }

}
