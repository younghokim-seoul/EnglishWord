import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';



part 'topics_provider.g.dart';

@riverpod
class SortedTopics extends _$SortedTopics {
  @override
  List<String> build() {
    final random = Random();
    final alphabets = List<String>.generate(
      'z'.codeUnitAt(0) - 'a'.codeUnitAt(0) + 1,
      (index) => String.fromCharCode('a'.codeUnitAt(0) + index),
    );
    alphabets.shuffle(random);

    return alphabets;
  }
}
