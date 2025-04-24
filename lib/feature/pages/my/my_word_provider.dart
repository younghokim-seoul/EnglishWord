import 'package:englishword/core/database/entity/my_word_entity.dart';
import 'package:englishword/core/database/repository/word_repository.dart';
import 'package:englishword/core/di/app_modules.dart';
import 'package:englishword/feature/pages/my/my_word_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/logger/app_logger.dart';
import '../depth/provider/favorite_provider.dart';

part 'my_word_provider.g.dart';

@riverpod
class MyWordProvider extends _$MyWordProvider {
  @override
  MyWordState build() {
    return const MyWordState(myWordList: [], blurList: []);
  }

  Future<void> getMyWordList() async {
    final repository = getIt<WordRepository>();
    final myWordList = await repository.getMyWord();

    logger.i("getMyWordList: $myWordList");

    state = state.copyWith(myWordList: myWordList);
  }

  Future<void> deleteMyWord(MyWordEntity model) async {
    await ref.read(favoriteProviderProvider.notifier).toggleFavorite(model.word);
    final removedModel = state.myWordList..remove(model);
    state = state.copyWith(myWordList: [...removedModel]);
  }

  void toggleBlur(MyWordEntity model) {
    if (state.blurList.contains(model)) {
      final removedModel = state.blurList..remove(model);
      state = state.copyWith(blurList: [...removedModel]);
    } else {
      state = state.copyWith(blurList: [...state.blurList, model]);
    }
  }


}
