import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/router/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'example_depth_route_arg.g.dart';

@riverpod
ExampleDepthRouteArg exampleDepthRouteArg(ExampleDepthRouteArgRef ref) {
  return ExampleDepthRoute.arg;
}

typedef ExampleDepthRouteArg = ({String exampleWord,int exampleSeq});
