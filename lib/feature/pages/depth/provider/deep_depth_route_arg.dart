import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/router/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'deep_depth_route_arg.g.dart';

@riverpod
DeepDepthRouteArg deepDepthRouteArg(DeepDepthRouteArgRef ref) {
  return DeepDepthRoute.arg;
}

typedef DeepDepthRouteArg = ({WordWithWords model,String depth2,String depth3});
