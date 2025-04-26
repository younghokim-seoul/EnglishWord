import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/database/domain/sub_word_with_words.dart';
import 'package:englishword/core/database/domain/word_example_view.dart';
import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/database/entity/my_word_entity.dart';
import 'package:englishword/core/database/entity/word_example_detail.dart';
import 'package:englishword/core/database/entity/word_example_entity.dart';
import 'package:englishword/core/database/entity/word_info_entity.dart';
import 'package:englishword/core/database/entity/word_mean_entity.dart';
import 'package:englishword/core/database/repository/word_repository.dart';
import 'package:englishword/core/database/word_dao.dart';
import 'package:englishword/core/logger/app_logger.dart';

class WordRepositoryImpl implements WordRepository {
  final WordDAO wordDAO;

  WordRepositoryImpl({required this.wordDAO});

  @override
  Future<void> insertMyWord(String word,String bold) =>
      wordDAO.insertMyWord(word,bold);

  @override
  Future<void> insertWordExamples(List<WordExampleEntity> wordExampleList) =>
      wordDAO.insertWordExamples(wordExampleList);

  @override
  Future<void> insertWordInfos(List<WordInfoEntity> wordInfoList) {
    return wordDAO.insertWordInfos(wordInfoList);
  }

  @override
  Future<void> insertWordMeans(List<WordMeanEntity> wordMeanList) =>
      wordDAO.insertWordMeans(wordMeanList);

  @override
  Future<int> countWordExample() async => await wordDAO.countWordExample() ?? 0;

  @override
  Future<int> countWordInfo() async => await wordDAO.countWordInfo() ?? 0;

  @override
  Future<int> countWordMean() async => await wordDAO.countWordMean() ?? 0;

  @override
  Future<List<WordWithWords>> getGroupedWords() => wordDAO.getGroupedWords();

  @override
  Future<SubWordWithWords?> getSubWordsByWord(String word) =>
      wordDAO.getSubWordsByWord(word);

  @override
  Future<DeepWordWithWords?> getDeepWordsByWord(String word) =>
      wordDAO.getDeepWordsByWord(word);

  @override
  Future<List<WordExampleView>> getExamples(String word, int seq) =>
      wordDAO.getExamples(word);

  @override
  Future<void> deleteMyWord(String word,String bold) => wordDAO.deleteMyWord(word,bold);

  @override
  Future<List<MyWordEntity>> getMyWord() => wordDAO.getMyWord();
}
