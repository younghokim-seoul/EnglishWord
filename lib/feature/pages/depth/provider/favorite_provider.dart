import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_provider.g.dart';

@riverpod
class FavoriteProvider extends _$FavoriteProvider {
  @override
  List<DeepWordInfo> build() {
    return [];
  }
  void toggleFavorite(DeepWordInfo targetModel) {

    if (state.contains(targetModel)) {
      final removedModel = state..remove(targetModel);
      state = [...removedModel];
    } else {
      state = [...state, targetModel];
    }
  }

  void addAll(List<DeepWordInfo> list) {
    state = [...list];
  }
}


@Riverpod(keepAlive: true)
class BlurProvider extends _$BlurProvider {
  @override
  List<DeepWordInfo> build() {
    logger.d("build BlurProvider");
    return [];
  }
  void toggleBlur(DeepWordInfo targetModel) {

    if (state.contains(targetModel)) {
      final removedModel = state..remove(targetModel);
      state = [...removedModel];
    } else {
      state = [...state, targetModel];
    }
  }
}