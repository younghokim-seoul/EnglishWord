import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:englishword/core/logger/app_logger.dart';

@DatabaseView('''
  SELECT wm.word, 
         '[' || GROUP_CONCAT(
           '{"seq":"'||wm.seq||
           '","mean":"'||wm.mean||
           '","bold":"'||wm.bold||'"}'
         ) || ']' AS means
  FROM word_info wi
  INNER JOIN word_mean wm ON wm.word = wi.word
  WHERE wi.depth = 4
  GROUP BY wm.word
''')
class WordMeanWithInfo {
  final String word;
  final String means;

  WordMeanWithInfo(this.word, this.means);

  @override
  String toString() {
    return 'WordMeanWithInfo{word: $word, means: $means}';
  }

  List<Map<String, dynamic>> get parsedMeans {
    try {
      final decoded = jsonDecode(means);
      if (decoded is List) {
        return decoded.whereType<Map>().cast<Map<String, dynamic>>().toList();
      }
    } catch (e) {
      logger.w('WordMeanWithInfo 파싱 오류: $e');
    }
    return [];
  }
}
