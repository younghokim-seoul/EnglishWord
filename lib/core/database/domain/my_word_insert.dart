import 'package:floor/floor.dart';

import 'package:floor/floor.dart';

@DatabaseView('''
  SELECT DISTINCT
         w4.word AS word,
         w4.bold AS word_bold,
         wm.p_word AS p_word,
         wm.means AS means
  FROM word_info w1
  INNER JOIN word_info w2 ON w2.p_word = w1.word AND w2.depth = 2
  INNER JOIN word_info w3 ON w3.p_word = w2.word AND w3.depth = 3
  INNER JOIN word_info w4 ON w4.p_word = w3.word AND w4.depth = 4
  INNER JOIN (
    SELECT wm.word,
           wm.p_word,
           '[' || GROUP_CONCAT(
             '{"seq":"' || wm.seq || '","mean":"' || wm.mean || '","bold":"' || wm.bold || '"}'
           ) || ']' AS means
    FROM word_info wi
    INNER JOIN word_mean wm ON wm.word = wi.word AND wm.p_word = wi.p_word
    WHERE wi.depth = 4
    GROUP BY wm.word, wm.p_word
  ) wm ON wm.word = w4.word AND wm.p_word = w4.p_word
  WHERE w1.depth = 1
''')
class MyWordInsertView {
  final String word;
  final String word_bold;
  final String p_word;
  final String means;

  MyWordInsertView(this.word, this.word_bold, this.p_word, this.means);
}




