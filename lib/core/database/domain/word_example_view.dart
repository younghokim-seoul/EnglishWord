import 'package:floor/floor.dart';

@DatabaseView('''
  SELECT we.word,
         wm.seq,
         wm.mean,
         we.example,
         we.transfer,
         wi.p_word AS p_word
  FROM word_info wi
  INNER JOIN word_mean wm ON wm.word = wi.word
  INNER JOIN word_example we ON we.word = wm.word AND we.seq = wm.seq
  WHERE wi.depth = 4
''')
class WordExampleView {
  final String word;
  final int seq;
  final String mean;
  final String example;
  final String transfer;
  final String p_word;

  WordExampleView(
      this.word,
      this.seq,
      this.mean,
      this.example,
      this.transfer,
      this.p_word,
      );

  @override
  String toString() {
    return 'WordExampleView{word: $word, seq: $seq, mean: $mean, example: $example, transfer: $transfer, p_word: $p_word}';
  }
}
