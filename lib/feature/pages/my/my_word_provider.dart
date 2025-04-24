import 'package:englishword/core/database/entity/my_word_entity.dart';
import 'package:englishword/core/database/repository/word_repository.dart';
import 'package:englishword/core/di/app_modules.dart';
import 'package:englishword/feature/pages/my/my_word_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    state = state.copyWith(myWordList: myWordList);
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
