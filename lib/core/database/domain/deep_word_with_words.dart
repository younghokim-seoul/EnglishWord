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

  List<Map<String, dynamic>> get parsedWordList {
    try {
      final decoded = jsonDecode(words);
      if (decoded is List) {
        return decoded
            .whereType<Map>()
            .cast<Map<String, dynamic>>()
            .toList();
      }
    } catch (e) {
      logger.w('DeepWordWithWords 파싱 오류: $e');
    }
    return [];
  }
}
