import 'package:floor/floor.dart';

@DatabaseView('''
  SELECT we.word,
         we.seq,               -- ✅ 반드시 포함해야 함!
         we.example,
         we.transfer
  FROM word_info wi 
  INNER JOIN word_mean wm ON wm.word = wi.word
  INNER JOIN word_example we ON we.word = wm.word AND we.seq = wm.seq
  WHERE wi."depth" = 4
''')
class WordExampleView {
  final String word;
  final int seq;
  final String example;
  final String transfer;

  WordExampleView(
      this.word,
      this.seq,
      this.example,
      this.transfer,
      );

  @override
  String toString() {
    return 'WordExampleView{word: $word, seq: $seq, example: $example, transfer: $transfer}';
  }


}
