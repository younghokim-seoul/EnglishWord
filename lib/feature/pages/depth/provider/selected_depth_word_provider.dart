import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_depth_word_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedDepthWordProvider extends _$SelectedDepthWordProvider {
  @override
  List<String> build() {
    return [];
  }

  static const limitCount = 3;


  void addDepth(String word) {
    state = [...state, word];
  }

  void removeDepth() {
    final removeWord = state..remove(state.last);
    state = [...removeWord];
  }

  void removeAllDepth() {
    state = [];
  }

}