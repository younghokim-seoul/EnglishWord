import 'package:englishword/core/constants/word_board_tab_type.dart';
import 'package:englishword/core/database/domain/sub_word_with_words.dart';
import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/database/repository/word_repository.dart';
import 'package:englishword/core/di/app_modules.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sub_word_provider.g.dart';

@riverpod
class SubWordProvider extends _$SubWordProvider {
  @override
  FutureOr<SubWordWithWords?> build(String word) async {
    logger.i("SubWordProvider >>>>>>>>>>>>>>");
    final repository = getIt<WordRepository>();
    return await repository.getSubWordsByWord(word);
  }
}

