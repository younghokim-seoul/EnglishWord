import 'dart:convert';

import 'package:englishword/core/logger/app_logger.dart';
import 'package:floor/floor.dart';

@DatabaseView('''
  SELECT 
    t1.word AS word,
    '[' || GROUP_CONCAT('"' || t2.word || '"') || ']' AS words
  FROM (
    SELECT word 
    FROM word_info 
    WHERE depth = 2
  ) AS t1
  INNER JOIN (
    SELECT word, bold, p_word 
    FROM word_info 
    WHERE depth = 3
  ) AS t2 
    ON t2.p_word = t1.word
  GROUP BY t1.word
''')
class SubWordWithWords {
  final String word;
  final String words;

  SubWordWithWords(this.word, this.words);

  @override
  String toString() {
    return 'SubWordWithWords{word: $word, words: $words}';
  }

  List<String> get parsedWords {
    try {
      final decoded = jsonDecode(words);
      if (decoded is List) {
        return decoded.whereType<String>().toList();
      }
    } catch (e) {
      logger.w('SubWordWithWords 파싱 오류: $e');
    }
    return [];
  }
}
