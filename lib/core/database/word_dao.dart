import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/database/domain/sub_word_with_words.dart';
import 'package:englishword/core/database/domain/word_example_view.dart';
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

  @Query('SELECT * FROM WordWithWords')
  Future<List<WordWithWords>> getGroupedWords();

  @Query('SELECT * FROM SubWordWithWords WHERE word = :word')
  Future<SubWordWithWords?> getSubWordsByWord(String word);

  @Query('SELECT * FROM DeepWordWithWords WHERE word = :word')
  Future<DeepWordWithWords?> getDeepWordsByWord(String word);

  @Query('SELECT * FROM WordMeanWithInfo WHERE word = :word')
  Future<WordMeanWithInfo?> getWordMean(String word);

  @Query('SELECT * FROM WordExampleView WHERE word = :word AND seq = :seq')
  Future<List<WordExampleView>> getExamples(String word, int seq);

  @Query('''
  INSERT INTO my_word (depth_word_1, depth_word_2, depth_word_3, depth_word_4, means)
  SELECT * FROM MyWordInsertView
  WHERE depth_word_4 = :word
''')
  Future<void> insertMyWord(String word);

  @Query('''
  DELETE FROM my_word
  WHERE depth_word_4 = :word
''')
  Future<void> deleteMyWord(String word);
}
