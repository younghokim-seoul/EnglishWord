import 'package:englishword/core/database/entity/my_word_entity.dart';

class MyWordState {
  final List<MyWordEntity> myWordList;
  final List<MyWordEntity> blurList;

  const MyWordState({required this.myWordList, required this.blurList});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyWordState &&
          runtimeType == other.runtimeType &&
          myWordList == other.myWordList &&
          blurList == other.blurList);

  @override
  int get hashCode => myWordList.hashCode ^ blurList.hashCode;

  @override
  String toString() {
    return 'MyWordState{' +
        ' myWordList: $myWordList,' +
        ' blurList: $blurList,' +
        '}';
  }

  MyWordState copyWith({
    List<MyWordEntity>? myWordList,
    List<MyWordEntity>? blurList,
  }) {
    return MyWordState(
      myWordList: myWordList ?? this.myWordList,
      blurList: blurList ?? this.blurList,
    );
  }

  Map<String, dynamic> toMap() {
    return {'myWordList': this.myWordList, 'blurList': this.blurList};
  }

  factory MyWordState.fromMap(Map<String, dynamic> map) {
    return MyWordState(
      myWordList: map['myWordList'] as List<MyWordEntity>,
      blurList: map['blurList'] as List<MyWordEntity>,
    );
  }
}
