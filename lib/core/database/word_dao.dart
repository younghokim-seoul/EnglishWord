import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/database/domain/sub_word_with_words.dart';
import 'package:englishword/core/database/domain/word_example_view.dart';
import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/database/entity/my_word_entity.dart';
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

  @Query('SELECT * FROM WordWithWords')
  Future<List<WordWithWords>> getGroupedWords();

  @Query('SELECT * FROM SubWordWithWords WHERE word = :word')
  Future<SubWordWithWords?> getSubWordsByWord(String word);

  @Query('SELECT * FROM DeepWordWithWords WHERE word = :word')
  Future<DeepWordWithWords?> getDeepWordsByWord(String word);


  @Query('SELECT * FROM WordExampleView WHERE word = :word')
  Future<List<WordExampleView>> getExamples(String word);

  @Query('''
  INSERT INTO my_word (word, word_bold, means)
  SELECT word, word_bold, means
  FROM MyWordInsertView
  WHERE word = :word
    AND p_word = :pWord
''')
  Future<void> insertMyWord(String word, String pWord);

  @Query('''
  DELETE FROM my_word
  WHERE word = :word 
  AND word_bold = :bold
''')
  Future<void> deleteMyWord(String word,String bold);


  @Query('SELECT * FROM my_word')
  Future<List<MyWordEntity>> getMyWord();

}
