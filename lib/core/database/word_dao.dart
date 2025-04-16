import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/database/domain/sub_word_with_words.dart';
import 'package:englishword/core/database/domain/word_mean_with_info.dart';
import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/database/entity/word_example_detail.dart';
import 'package:englishword/core/database/entity/word_example_entity.dart';
import 'package:englishword/core/database/entity/word_info_entity.dart';
import 'package:englishword/core/database/entity/word_mean_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class WordDAO {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertWordInfos(List<WordInfoEntity> wordInfoList);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertWordExamples(List<WordExampleEntity> wordExampleList);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertWordMeans(List<WordMeanEntity> wordMeanList);

  @Query('SELECT COUNT(*) FROM word_info')
  Future<int?> countWordInfo();

  @Query('SELECT COUNT(*) FROM word_example')
  Future<int?> countWordExample();

  @Query('SELECT COUNT(*) FROM word_mean')
  Future<int?> countWordMean();

  @Query('''
    INSERT INTO my_word
    SELECT w1.word,
           w2.word,
           w3.word,
           w4.word,
           wm.means
    FROM   word_info w1
    INNER JOIN word_info w2 
            ON w2.p_word = w1.word
           AND w2."depth" = 2
    INNER JOIN word_info w3 
            ON w3.p_word = w2.word
           AND w3."depth" = 3
    INNER JOIN word_info w4 
            ON w4.p_word = w3.word
           AND w4."depth" = 4
    INNER JOIN (
        SELECT wm.word, 
               '[' || group_concat('{"seq":"' || wm.seq || '","mean":"'
                || wm.mean || '","bold":"' || wm.bold || '"}') || ']' AS means 
        FROM   word_info wi
        INNER JOIN word_mean wm ON wm.word = wi.word
        WHERE  wi."depth" = 4
        GROUP BY wm.word
    ) wm ON wm.word = w4.word
    WHERE  w1."depth" = 1
      AND  w4.word = :targetWord
  ''')
  Future<void> insertMyWord(String targetWord);

  //뎁스 1 단어 불러오기
  @Query('SELECT * FROM WordWithWords')
  Future<List<WordWithWords>> getGroupedWords();

  @Query('SELECT * FROM SubWordWithWords WHERE word = :word')
  Future<SubWordWithWords?> getSubWordsByWord(String word);

  @Query('SELECT * FROM DeepWordWithWords WHERE word = :word')
  Future<DeepWordWithWords?> getDeepWordsByWord(String word);

  @Query('SELECT * FROM WordMeanWithInfo WHERE word = :word')
  Future<WordMeanWithInfo?> getWordMean(String word);


  @Query('''
  SELECT we.word,
         we.example,
         we.transfer
  FROM word_info wi
  INNER JOIN word_mean wm ON wm.word = wi.word
  INNER JOIN word_example we ON we.word = wm.word AND we.seq = wm.seq
  WHERE wi."depth" = 4
    AND we.word = :word
    AND we.seq = :seq
''')
  Future<List<WordExampleDetail>> getExamples(String word, int seq);
}
