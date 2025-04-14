import 'dart:convert';

import 'package:englishword/core/extension/list_extension.dart';
import 'package:floor/floor.dart';
import 'package:englishword/core/logger/app_logger.dart';

@DatabaseView('''
  SELECT t1.word,
         '[' || GROUP_CONCAT(
           '{"word":"'||t2.word||
           '","bold":"'||t2.bold||
           '","chk":"'||t2.chk||
           '","means":'||t2.means||
           '}'
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
           END AS chk,
           wm.means
    FROM word_info wi
    INNER JOIN (
      SELECT wm.word,
             '[' || GROUP_CONCAT(
               '{"seq":"' || wm.seq ||
               '","mean":"' || wm.mean ||
               '","bold":"' || wm.bold || '"}'
             ) || ']' AS means
      FROM word_info wi
      INNER JOIN word_mean wm ON wm.word = wi.word
      WHERE wi.depth = 4
      GROUP BY wm.word
    ) wm ON wm.word = wi.word
    LEFT OUTER JOIN my_word mw ON mw.depth_word_4 = wi.word
    WHERE wi.depth = 4
  ) AS t2 ON t2.p_word = t1.word
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
            .toList()
            .distinctBy((e) => e.word)
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
  final List<WordMeaningInfo> means;

  //<editor-fold desc="Data Methods">

  const DeepWordInfo({
    required this.word,
    required this.bold,
    required this.chk,
    required this.means,
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
          chk == other.chk &&
          means == other.means);

  @override
  int get hashCode =>
      word.hashCode ^ bold.hashCode ^ chk.hashCode ^ means.hashCode;

  @override
  String toString() {
    return 'DeepWordInfo{' +
        ' word: $word,' +
        ' bold: $bold,' +
        ' chk: $chk,' +
        ' means: $means,' +
        '}';
  }

  DeepWordInfo copyWith({
    String? word,
    String? bold,
    String? chk,
    List<WordMeaningInfo>? means,
  }) {
    return DeepWordInfo(
      word: word ?? this.word,
      bold: bold ?? this.bold,
      chk: chk ?? this.chk,
      means: means ?? this.means,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'word': this.word,
      'bold': this.bold,
      'chk': this.chk,
      'means': this.means,
    };
  }

  factory DeepWordInfo.fromMap(Map<String, dynamic> map) {
    final meansRaw = map['means'];

    List<WordMeaningInfo> parsedMeans = [];

    // 🔥 이 부분이 중요: dynamic list → map list → WordMeaningInfo
    if (meansRaw is List) {
      parsedMeans = meansRaw
          .whereType<Map>() // dynamic → Map
          .map((m) => WordMeaningInfo.fromMap(m.cast<String, dynamic>()))
          .toList();
    }

    return DeepWordInfo(
      word: map['word'] as String,
      bold: map['bold'] as String,
      chk: map['chk'] as String,
      means: parsedMeans
    );
  }

  //</editor-fold>
}

class WordMeaningInfo {
  final String seq;
  final String mean;
  final String bold;

  //<editor-fold desc="Data Methods">
  const WordMeaningInfo({
    required this.seq,
    required this.mean,
    required this.bold,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordMeaningInfo &&
          runtimeType == other.runtimeType &&
          seq == other.seq &&
          mean == other.mean &&
          bold == other.bold);

  @override
  int get hashCode => seq.hashCode ^ mean.hashCode ^ bold.hashCode;

  @override
  String toString() {
    return 'WordMeaningInfo{' +
        ' seq: $seq,' +
        ' mean: $mean,' +
        ' bold: $bold,' +
        '}';
  }

  WordMeaningInfo copyWith({String? seq, String? mean, String? bold}) {
    return WordMeaningInfo(
      seq: seq ?? this.seq,
      mean: mean ?? this.mean,
      bold: bold ?? this.bold,
    );
  }

  Map<String, dynamic> toMap() {
    return {'seq': this.seq, 'mean': this.mean, 'bold': this.bold};
  }

  factory WordMeaningInfo.fromMap(Map<String, dynamic> map) {
    return WordMeaningInfo(
      seq: map['seq'] as String,
      mean: map['mean'] as String,
      bold: map['bold'] as String,
    );
  }

  //</editor-fold>
}
