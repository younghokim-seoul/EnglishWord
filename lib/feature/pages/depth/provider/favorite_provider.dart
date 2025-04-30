import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/database/repository/word_repository.dart';
import 'package:englishword/core/di/app_modules.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_provider.g.dart';

@Riverpod(keepAlive: true)
class FavoriteProvider extends _$FavoriteProvider {
  @override
  List<String> build() {
    return [];
  }

  Future<void> toggleFavorite(String word,String p_word,String bold) async {
    final repository = getIt<WordRepository>();
    if (state.contains(word)) {
      await repository.deleteMyWord(word,bold);
      final removedModel = state..remove(word);
      state = [...removedModel];
    } else {
      await repository.insertMyWord(word,p_word);
      state = [...state, word];
    }
  }

  void addAll(List<String> list) {
    state = [...list];
  }
}

@Riverpod(keepAlive: true)
class BlurProvider extends _$BlurProvider {
  @override
  List<String> build() {
    logger.d("build BlurProvider");
    return [];
  }

  void toggleBlur(String word) {
    if (state.contains(word)) {
      final removedModel = state..remove(word);
      state = [...removedModel];
    } else {
      state = [...state, word];
    }
  }
}
