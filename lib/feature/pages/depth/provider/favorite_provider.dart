import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/database/repository/word_repository.dart';
import 'package:englishword/core/di/app_modules.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_provider.g.dart';

@Riverpod(keepAlive: true)
class FavoriteProvider extends _$FavoriteProvider {
  @override
  List<DeepWordInfo> build() {
    return [];
  }

  Future<void> toggleFavorite(DeepWordInfo targetModel) async {
    final repository = getIt<WordRepository>();
    if (state.contains(targetModel)) {
      await repository.deleteMyWord(targetModel.word);
   //   final removedModel = state..remove(targetModel);

      ///  state = [...removedModel];
    } else {
      await repository.insertMyWord(targetModel.word);
      //    state = [...state, targetModel];
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
