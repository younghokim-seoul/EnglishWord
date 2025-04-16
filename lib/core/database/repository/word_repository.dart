import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/database/domain/sub_word_with_words.dart';
import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/database/entity/word_example_detail.dart';
import 'package:englishword/core/database/entity/word_example_entity.dart';
import 'package:englishword/core/database/entity/word_info_entity.dart';
import 'package:englishword/core/database/entity/word_mean_entity.dart';

abstract interface class WordRepository {

  Future<void> insertWordInfos(List<WordInfoEntity> wordInfoList);

  Future<void> insertWordExamples(List<WordExampleEntity> wordExampleList);

  Future<void> insertWordMeans(List<WordMeanEntity> wordMeanList);

  Future<void> insertMyWord(String targetWord);

  Future<int> countWordInfo();

  Future<int> countWordExample();

  Future<int> countWordMean();

  Future<List<WordWithWords>> getGroupedWords();

  Future<SubWordWithWords?> getSubWordsByWord(String word);

  Future<DeepWordWithWords?> getDeepWordsByWord(String word);

  Future<List<WordExampleDetail>> getExamples(String word, int seq);
}
