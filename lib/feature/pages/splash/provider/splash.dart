import 'dart:convert';
import 'dart:ffi';

import 'package:englishword/core/constants/assets.dart';
import 'package:englishword/core/database/entity/word_example_entity.dart';
import 'package:englishword/core/database/entity/word_info_entity.dart';
import 'package:englishword/core/database/entity/word_mean_entity.dart';
import 'package:englishword/core/database/repository/word_repository.dart';
import 'package:englishword/core/di/app_modules.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash.g.dart';

@riverpod
class ReadyWords extends _$ReadyWords {
  @override
  FutureOr<void> build() async {


      final jsonWordInfo =
          json.decode(await rootBundle.loadString(Assets.jsonWordInfo))
              as List<dynamic>;

      final wordInfoList =
          jsonWordInfo.map((e) => WordInfoEntity.fromMap(e)).toList();

      logger.d("wordInfoList.. " + wordInfoList.length.toString());

      logger.d("wordInfoList.. last " + wordInfoList.last.toString());

    final repository = getIt<WordRepository>();

    bool didInsert = false;

    if (await repository.countWordExample() == 0) {
      logger.i("word_example 삽입 필요 ");

      final jsonWordExample =
          json.decode(await rootBundle.loadString(Assets.jsonWordExample))
              as List<dynamic>;

      final wordExampleList =
          jsonWordExample.map((e) => WordExampleEntity.fromMap(e)).toList();

      await repository.insertWordExamples(wordExampleList);
      didInsert = true;
    }

    if (await repository.countWordInfo() == 0) {
      logger.i("word_info 삽입 필요 ");
      final jsonWordInfo =
          json.decode(await rootBundle.loadString(Assets.jsonWordInfo))
              as List<dynamic>;

      final wordInfoList =
          jsonWordInfo.map((e) => WordInfoEntity.fromMap(e)).toList();

      await repository.insertWordInfos(wordInfoList);
      didInsert = true;
    }

    if (await repository.countWordMean() == 0) {
      logger.i("word_mean 삽입 필요 ");
      final jsonWordMean =
          json.decode(await rootBundle.loadString(Assets.jsonWordMean))
              as List<dynamic>;

      final wordMeanList =
          jsonWordMean.map((e) => WordMeanEntity.fromMap(e)).toList();

      await repository.insertWordMeans(wordMeanList);
      didInsert = true;
    }


    if(!didInsert){
      logger.i("모든 데이터가 존재합니다. 딜레이 후 진행");
      await Future.delayed(const Duration(seconds: 2));
    }

  }


}
