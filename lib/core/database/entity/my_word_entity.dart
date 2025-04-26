import 'dart:convert';

import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:floor/floor.dart';

import '../../logger/app_logger.dart';

@Entity(tableName: 'my_word')
class MyWordEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String word;
  final String word_bold;
  final String means;


  bool get isBold => word_bold == 'Y';
  List<WordMeaningInfo> get parsedWordList {
    try {
      final decoded = jsonDecode(means);
      if (decoded is List) {
        return decoded
            .whereType<Map>()
            .map((map) => WordMeaningInfo.fromMap(map.cast<String, dynamic>()))
            .toList();
      }
    } catch (e) {
      logger.w('DeepWordWithWords 파싱 오류: $e');
    }
    return [];
  }

  //<editor-fold desc="Data Methods">
  const MyWordEntity({
    this.id,
    required this.word,
    required this.word_bold,
    required this.means,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyWordEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          word == other.word &&
          word_bold == other.word_bold &&
          true);

  @override
  int get hashCode => id.hashCode ^ word.hashCode ^ word_bold.hashCode;

  @override
  String toString() {
    return 'MyWordEntity{' +
        ' id: $id,' +
        ' word: $word,' +
        ' word_bold: $word_bold,' +
        ' means: $means,' +
        '}';
  }

  MyWordEntity copyWith({
    int? id,
    String? word,
    String? word_bold,
    String? means,
  }) {
    return MyWordEntity(
      id: id ?? this.id,
      word: word ?? this.word,
      word_bold: word_bold ?? this.word_bold,
      means: means ?? this.means,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'word': this.word,
      'word_bold': this.word_bold,
      'means': this.means,
    };
  }

  factory MyWordEntity.fromMap(Map<String, dynamic> map) {
    return MyWordEntity(
      id: map['id'] as int,
      word: map['word'] as String,
      word_bold: map['word_bold'] as String,
      means: map['means'] as String,
    );
  }

  //</editor-fold>
}
