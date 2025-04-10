import 'package:englishword/core/constants/word_board_tab_type.dart';
import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/feature/pages/home/provider/group_word_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin class HomeState {
  AsyncValue<WordWithWords> targetedTopics(WidgetRef ref, WordBoardTabType tabType)  {
    return ref.watch(filteredGroupWordProvider(tabType));

  }
}

