import 'package:englishword/core/database/domain/deep_word_with_words.dart';
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


@riverpod
class BlurProvider extends _$BlurProvider {
  @override
  List<DeepWordInfo> build() {
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