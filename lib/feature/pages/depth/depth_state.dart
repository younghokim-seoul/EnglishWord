import 'package:englishword/core/database/domain/sub_word_with_words.dart';
import 'package:englishword/feature/pages/depth/provider/depth_route_arg.dart';
import 'package:englishword/feature/pages/depth/provider/selected_depth_word_provider.dart';
import 'package:englishword/feature/pages/depth/provider/sub_word_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin class DepthState {
  DepthRouteArg arg(WidgetRef ref) => ref.watch(depthRouteArgProvider);



  List<String> combineHeader(WidgetRef ref) {
    final depth  = ref.read(selectedDepthWordProviderProvider);
    final header = arg(ref).model.word;

    return [header,...depth];
  }

  AsyncValue<SubWordWithWords?> getSubWordWithWords(WidgetRef ref)  {
    final head  = ref.read(selectedDepthWordProviderProvider).last;
    return ref.watch(subWordProviderProvider(head));
  }
}
