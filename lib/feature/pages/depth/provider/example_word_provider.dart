import 'package:englishword/core/constants/word_board_tab_type.dart';
import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/database/domain/sub_word_with_words.dart';
import 'package:englishword/core/database/domain/word_example_view.dart';
import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/database/entity/word_example_detail.dart';
import 'package:englishword/core/database/entity/word_example_entity.dart';
import 'package:englishword/core/database/repository/word_repository.dart';
import 'package:englishword/core/di/app_modules.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:englishword/feature/pages/depth/provider/favorite_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example_word_provider.g.dart';

@riverpod
class ExampleWordProvider extends _$ExampleWordProvider {
  @override
  FutureOr<List<WordExampleView>> build(String word, int seq) async {
    final repository = getIt<WordRepository>();
    final list = await repository.getExamples(word, seq);
    logger.d("list => $list");
    return list;
  }
}
