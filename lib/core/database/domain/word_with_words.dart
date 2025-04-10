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
    WHERE depth = 1
  ) AS t1
  INNER JOIN (
    SELECT word, bold, p_word 
    FROM word_info 
    WHERE depth = 2
  ) AS t2 
    ON t2.p_word = t1.word
  GROUP BY t1.word
''')
class WordWithWords {
  final String word;
  final String words;

  WordWithWords(this.word, this.words);

  @override
  String toString() {
    return 'WordWithWords{word: $word, words: $words}';
  }

  List<String> get parsedWords {
    try {
      final decoded = jsonDecode(words);
      if (decoded is List) {
        return decoded.whereType<String>().toList();
      }
    } catch (e) {
      logger.w('WordWithWords 파싱 오류: $e');
    }
    return [];
  }
}
