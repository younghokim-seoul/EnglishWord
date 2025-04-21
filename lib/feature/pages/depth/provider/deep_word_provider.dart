import 'package:englishword/core/constants/word_board_tab_type.dart';
import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/database/domain/sub_word_with_words.dart';
import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/database/repository/word_repository.dart';
import 'package:englishword/core/di/app_modules.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:englishword/feature/pages/depth/provider/favorite_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deep_word_provider.g.dart';

@riverpod
class DeepWordProvider extends _$DeepWordProvider {
  @override
  Stream<DeepWordWithWords> build(String word) async* {
    final repository = getIt<WordRepository>();
    final stream = repository.getDeepWordsByWord(word);

    await for (final deepWordWithWords in stream) {
      // --- 부가 작업(Side Effect) 수행 ---

      if (deepWordWithWords == null) {
        throw Exception(
          "Received null DeepWordWithWords from repository for word: $word",
        );
      }

      final favoriteNotifier = ref.read(favoriteProviderProvider.notifier);
      final favoriteWords =
          deepWordWithWords.parsedWordList
              .where((element) => element.isFavorite)
              .toList();
      favoriteNotifier.addAll(favoriteWords); // 또는 setFavorites 등
      // ---------------------------------

      // 처리된 (또는 원본) 데이터를 이 프로바이더의 스트림으로 방출
      yield deepWordWithWords;
    }

    // if (list != null) {
    //   ref
    //       .watch(favoriteProviderProvider.notifier)
    //       .addAll(
    //         list.parsedWordList.where((element) => element.isFavorite).toList(),
    //       );
    // }
    // return list;
  }
}
