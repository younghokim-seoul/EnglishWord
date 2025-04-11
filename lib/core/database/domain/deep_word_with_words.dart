import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:englishword/core/logger/app_logger.dart';

@DatabaseView('''
  SELECT t1.word,
         '[' || GROUP_CONCAT(
           '{"word":"'||t2.word||
           '","bold":"'||t2.bold||
           '","chk":"'||t2.chk||'"}'
         ) || ']' AS words
  FROM (
    SELECT word 
    FROM word_info 
    WHERE depth = 3
  ) AS t1
  INNER JOIN (
    SELECT wi.word,
           wi.bold,
           wi.p_word,
           CASE 
             WHEN mw.depth_word_4 IS NOT NULL THEN 'Y'
             ELSE 'N'
           END AS chk
    FROM word_info wi
    LEFT OUTER JOIN my_word mw
      ON mw.depth_word_4 = wi.word
    WHERE wi.depth = 4
  ) AS t2
    ON t2.p_word = t1.word
  GROUP BY t1.word
''')
class DeepWordWithWords {
  final String word;
  final String words; // JSON array string of objects

  DeepWordWithWords(this.word, this.words);

  @override
  String toString() {
    return 'DeepWordWithWords{word: $word, words: $words}';
  }

  List<DeepWordInfo> get parsedWordList {
    try {
      final decoded = jsonDecode(words);
      if (decoded is List) {
        return decoded
            .whereType<Map>()
            .map((map) => DeepWordInfo.fromMap(map.cast<String, dynamic>()))
            .toList();
      }
    } catch (e) {
      logger.w('DeepWordWithWords 파싱 오류: $e');
    }
    return [];
  }
}

class DeepWordInfo {
  final String word;
  final String bold;
  final String chk;

  //<editor-fold desc="Data Methods">
  const DeepWordInfo({
    required this.word,
    required this.bold,
    required this.chk,
  });

  bool get isFavorite => chk == 'Y';
  bool get isBold => bold == 'Y';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeepWordInfo &&
          runtimeType == other.runtimeType &&
          word == other.word &&
          bold == other.bold &&
          chk == other.chk);

  @override
  int get hashCode => word.hashCode ^ bold.hashCode ^ chk.hashCode;

  @override
  String toString() {
    return 'DeepWordInfo{' +
        ' word: $word,' +
        ' bold: $bold,' +
        ' chk: $chk,' +
        '}';
  }

  DeepWordInfo copyWith({String? word, String? bold, String? chk}) {
    return DeepWordInfo(
      word: word ?? this.word,
      bold: bold ?? this.bold,
      chk: chk ?? this.chk,
    );
  }

  Map<String, dynamic> toMap() {
    return {'word': this.word, 'bold': this.bold, 'chk': this.chk};
  }

  factory DeepWordInfo.fromMap(Map<String, dynamic> map) {
    return DeepWordInfo(
      word: map['word'] as String,
      bold: map['bold'] as String,
      chk: map['chk'] as String,
    );
  }
  //</editor-fold>
}
