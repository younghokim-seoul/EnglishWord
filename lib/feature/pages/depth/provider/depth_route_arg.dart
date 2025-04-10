import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/router/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'depth_route_arg.g.dart';

@riverpod
DepthRouteArg depthRouteArg(DepthRouteArgRef ref) {
  return DepthRoute.arg;
}

typedef DepthRouteArg = ({WordWithWords model});
