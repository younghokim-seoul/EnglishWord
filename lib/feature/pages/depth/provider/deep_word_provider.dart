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
  FutureOr<DeepWordWithWords?> build(String word) async {
    final repository = getIt<WordRepository>();
    final list = await repository.getDeepWordsByWord(word);

    if (list != null) {
      ref
          .watch(favoriteProviderProvider.notifier)
          .addAll(
            list.parsedWordList.where((element) => element.isFavorite).toList(),
          );
    }
    return list;
  }
}
