import 'package:englishword/core/database/repository/word_repository.dart';
import 'package:englishword/core/database/repository/word_repository_impl.dart';
import 'package:englishword/core/database/word_dao.dart';
import 'package:englishword/core/database/word_database.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

final class AppModules {
  AppModules._();

  static Future<void> init() async {

    //database
    final wordDatabase = await $FloorWordDatabase.databaseBuilder('word.db').build();
    getIt.registerLazySingleton<WordDatabase>(() => wordDatabase);

    // dao
    getIt.registerLazySingleton<WordDAO>(() => getIt<WordDatabase>().wordDao);

    //repository
    getIt.registerLazySingleton<WordRepository>(() => WordRepositoryImpl(wordDAO: getIt<WordDAO>()));
  }
}