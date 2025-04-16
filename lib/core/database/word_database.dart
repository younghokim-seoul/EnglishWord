import 'dart:async';

import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/database/domain/sub_word_with_words.dart';
import 'package:englishword/core/database/domain/word_mean_with_info.dart';
import 'package:englishword/core/database/domain/word_with_words.dart';
import 'package:englishword/core/database/entity/my_word_entity.dart';
import 'package:englishword/core/database/entity/word_example_detail.dart';
import 'package:englishword/core/database/entity/word_example_entity.dart';
import 'package:englishword/core/database/entity/word_info_entity.dart';
import 'package:englishword/core/database/entity/word_mean_entity.dart';
import 'package:englishword/core/database/word_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'word_database.g.dart';

@Database(
  version: 1,
  entities: [WordMeanEntity, WordExampleEntity, MyWordEntity, WordInfoEntity, WordExampleDetail],
  views: [WordWithWords, SubWordWithWords, DeepWordWithWords,WordMeanWithInfo],
)
abstract class WordDatabase extends FloorDatabase {
  WordDAO get wordDao;
}
