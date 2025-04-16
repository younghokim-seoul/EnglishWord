import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/database/domain/word_example_view.dart';
import 'package:englishword/core/database/entity/word_example_detail.dart';
import 'package:englishword/feature/pages/depth/provider/deep_depth_route_arg.dart';
import 'package:englishword/feature/pages/depth/provider/deep_word_provider.dart';
import 'package:englishword/feature/pages/depth/provider/example_depth_route_arg.dart';
import 'package:englishword/feature/pages/depth/provider/example_word_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' show WidgetRef;
import 'package:riverpod_annotation/riverpod_annotation.dart';

mixin class ExampleDepthState {
  ExampleDepthRouteArg arg(WidgetRef ref) => ref.watch(exampleDepthRouteArgProvider);


  AsyncValue<List<WordExampleView>> getExampleWordWithWords(WidgetRef ref) {
    return ref.watch(exampleWordProviderProvider(arg(ref).exampleWord, arg(ref).exampleSeq));
  }

}
