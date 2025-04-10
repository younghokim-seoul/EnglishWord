import 'package:englishword/core/constants/word_board_tab_type.dart';
import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/database/repository/word_repository.dart';
import 'package:englishword/core/di/app_modules.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_word_provider.g.dart';

@Riverpod(keepAlive: true)
class GroupWordProvider extends _$GroupWordProvider {
  @override
  FutureOr<List<WordWithWords>> build() async {
    logger.i("GroupWordProvider >>>>>>>>>>>>>>");
    final repository = getIt<WordRepository>();
    final list = await repository.getGroupedWords();

    return list;
  }
}

@riverpod
class FilteredGroupWord extends _$FilteredGroupWord {
  @override
  FutureOr<WordWithWords> build(WordBoardTabType type) async {
    final list = await ref.watch(groupWordProviderProvider.future);
    final group = list.firstWhere((model) => model.word.toLowerCase() == type.label.toLowerCase());
    return group;

  }
}
