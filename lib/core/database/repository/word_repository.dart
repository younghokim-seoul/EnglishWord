import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/database/domain/sub_word_with_words.dart';
import 'package:englishword/core/database/domain/word_example_view.dart';
import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/database/entity/my_word_entity.dart';
import 'package:englishword/core/database/entity/word_example_entity.dart';
import 'package:englishword/core/database/entity/word_info_entity.dart';
import 'package:englishword/core/database/entity/word_mean_entity.dart';

abstract interface class WordRepository {
  Future<void> insertWordInfos(List<WordInfoEntity> wordInfoList);

  Future<void> insertWordExamples(List<WordExampleEntity> wordExampleList);

  Future<void> insertWordMeans(List<WordMeanEntity> wordMeanList);

  Future<void> insertMyWord(String word, String p_word);

  Future<void> deleteMyWord(String word, String bold);

  Future<int> countWordInfo();

  Future<int> countWordExample();

  Future<int> countWordMean();

  Future<List<WordWithWords>> getGroupedWords();

  Future<SubWordWithWords?> getSubWordsByWord(String word);

  Future<DeepWordWithWords?> getDeepWordsByWord(String word);

  Future<List<WordExampleView>> getExamples(String word, String seq);

  Future<List<MyWordEntity>> getMyWord();
}
