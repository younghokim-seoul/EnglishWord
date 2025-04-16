// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $WordDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $WordDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $WordDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<WordDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorWordDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $WordDatabaseBuilderContract databaseBuilder(String name) =>
      _$WordDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $WordDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$WordDatabaseBuilder(null);
}

class _$WordDatabaseBuilder implements $WordDatabaseBuilderContract {
  _$WordDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $WordDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $WordDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<WordDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$WordDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$WordDatabase extends WordDatabase {
  _$WordDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WordDAO? _wordDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `word_mean` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `seq` INTEGER NOT NULL, `word` TEXT NOT NULL, `mean` TEXT NOT NULL, `bold` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `word_example` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `seq` INTEGER NOT NULL, `word` TEXT NOT NULL, `example` TEXT NOT NULL, `transfer` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `my_word` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `depth_word_1` TEXT NOT NULL, `depth_word_2` TEXT NOT NULL, `depth_word_3` TEXT NOT NULL, `depth_word_4` TEXT NOT NULL, `mean` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `word_info` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `depth` INTEGER NOT NULL, `word` TEXT NOT NULL, `bold` TEXT NOT NULL, `p_word` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `word_example` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `seq` INTEGER NOT NULL, `word` TEXT NOT NULL, `example` TEXT NOT NULL, `transfer` TEXT NOT NULL)');

        await database.execute(
            'CREATE VIEW IF NOT EXISTS `WordWithWords` AS   SELECT \n    t1.word AS word,\n    \'[\' || GROUP_CONCAT(\'\"\' || t2.word || \'\"\') || \']\' AS words\n  FROM (\n    SELECT word \n    FROM word_info \n    WHERE depth = 1\n  ) AS t1\n  INNER JOIN (\n    SELECT word, bold, p_word \n    FROM word_info \n    WHERE depth = 2\n  ) AS t2 \n    ON t2.p_word = t1.word\n  GROUP BY t1.word\n');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `SubWordWithWords` AS   SELECT \n    t1.word AS word,\n    \'[\' || GROUP_CONCAT(\'\"\' || t2.word || \'\"\') || \']\' AS words\n  FROM (\n    SELECT word \n    FROM word_info \n    WHERE depth = 2\n  ) AS t1\n  INNER JOIN (\n    SELECT word, bold, p_word \n    FROM word_info \n    WHERE depth = 3\n  ) AS t2 \n    ON t2.p_word = t1.word\n  GROUP BY t1.word\n');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `DeepWordWithWords` AS   SELECT t1.word,\n         \'[\' || GROUP_CONCAT(\n           \'{\"word\":\"\'||t2.word||\n           \'\",\"bold\":\"\'||t2.bold||\n           \'\",\"chk\":\"\'||t2.chk||\n           \'\",\"means\":\'||t2.means||\n           \'}\'\n         ) || \']\' AS words\n  FROM (\n    SELECT word \n    FROM word_info \n    WHERE depth = 3\n  ) AS t1\n  INNER JOIN (\n    SELECT wi.word,\n           wi.bold,\n           wi.p_word,\n           CASE \n             WHEN mw.depth_word_4 IS NOT NULL THEN \'Y\'\n             ELSE \'N\'\n           END AS chk,\n           wm.means\n    FROM word_info wi\n    INNER JOIN (\n      SELECT wm.word,\n             \'[\' || GROUP_CONCAT(\n               \'{\"seq\":\"\' || wm.seq ||\n               \'\",\"mean\":\"\' || wm.mean ||\n               \'\",\"bold\":\"\' || wm.bold || \'\"}\'\n             ) || \']\' AS means\n      FROM word_info wi\n      INNER JOIN word_mean wm ON wm.word = wi.word\n      WHERE wi.depth = 4\n      GROUP BY wm.word\n    ) wm ON wm.word = wi.word\n    LEFT OUTER JOIN my_word mw ON mw.depth_word_4 = wi.word\n    WHERE wi.depth = 4\n  ) AS t2 ON t2.p_word = t1.word\n  GROUP BY t1.word\n');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `WordMeanWithInfo` AS   SELECT wm.word, \n         \'[\' || GROUP_CONCAT(\n           \'{\"seq\":\"\'||wm.seq||\n           \'\",\"mean\":\"\'||wm.mean||\n           \'\",\"bold\":\"\'||wm.bold||\'\"}\'\n         ) || \']\' AS means\n  FROM word_info wi\n  INNER JOIN word_mean wm ON wm.word = wi.word\n  WHERE wi.depth = 4\n  GROUP BY wm.word\n');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WordDAO get wordDao {
    return _wordDaoInstance ??= _$WordDAO(database, changeListener);
  }
}

class _$WordDAO extends WordDAO {
  _$WordDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _wordInfoEntityInsertionAdapter = InsertionAdapter(
            database,
            'word_info',
            (WordInfoEntity item) => <String, Object?>{
                  'id': item.id,
                  'depth': item.depth,
                  'word': item.word,
                  'bold': item.bold,
                  'p_word': item.p_word
                }),
        _wordExampleEntityInsertionAdapter = InsertionAdapter(
            database,
            'word_example',
            (WordExampleEntity item) => <String, Object?>{
                  'id': item.id,
                  'seq': item.seq,
                  'word': item.word,
                  'example': item.example,
                  'transfer': item.transfer
                }),
        _wordMeanEntityInsertionAdapter = InsertionAdapter(
            database,
            'word_mean',
            (WordMeanEntity item) => <String, Object?>{
                  'id': item.id,
                  'seq': item.seq,
                  'word': item.word,
                  'mean': item.mean,
                  'bold': item.bold
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WordInfoEntity> _wordInfoEntityInsertionAdapter;

  final InsertionAdapter<WordExampleEntity> _wordExampleEntityInsertionAdapter;

  final InsertionAdapter<WordMeanEntity> _wordMeanEntityInsertionAdapter;

  @override
  Future<int?> countWordInfo() async {
    return _queryAdapter.query('SELECT COUNT(*) FROM word_info',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<int?> countWordExample() async {
    return _queryAdapter.query('SELECT COUNT(*) FROM word_example',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<int?> countWordMean() async {
    return _queryAdapter.query('SELECT COUNT(*) FROM word_mean',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<void> insertMyWord(String targetWord) async {
    await _queryAdapter.queryNoReturn(
        'INSERT INTO my_word     SELECT w1.word,            w2.word,            w3.word,            w4.word,            wm.means     FROM   word_info w1     INNER JOIN word_info w2              ON w2.p_word = w1.word            AND w2.\"depth\" = 2     INNER JOIN word_info w3              ON w3.p_word = w2.word            AND w3.\"depth\" = 3     INNER JOIN word_info w4              ON w4.p_word = w3.word            AND w4.\"depth\" = 4     INNER JOIN (         SELECT wm.word,                 \'[\' || group_concat(\'{\"seq\":\"\' || wm.seq || \'\",\"mean\":\"\'                 || wm.mean || \'\",\"bold\":\"\' || wm.bold || \'\"}\') || \']\' AS means          FROM   word_info wi         INNER JOIN word_mean wm ON wm.word = wi.word         WHERE  wi.\"depth\" = 4         GROUP BY wm.word     ) wm ON wm.word = w4.word     WHERE  w1.\"depth\" = 1       AND  w4.word = ?1',
        arguments: [targetWord]);
  }

  @override
  Future<List<WordWithWords>> getGroupedWords() async {
    return _queryAdapter.queryList('SELECT * FROM WordWithWords',
        mapper: (Map<String, Object?> row) =>
            WordWithWords(row['word'] as String, row['words'] as String));
  }

  @override
  Future<SubWordWithWords?> getSubWordsByWord(String word) async {
    return _queryAdapter.query('SELECT * FROM SubWordWithWords WHERE word = ?1',
        mapper: (Map<String, Object?> row) =>
            SubWordWithWords(row['word'] as String, row['words'] as String),
        arguments: [word]);
  }

  @override
  Future<DeepWordWithWords?> getDeepWordsByWord(String word) async {
    return _queryAdapter.query(
        'SELECT * FROM DeepWordWithWords WHERE word = ?1',
        mapper: (Map<String, Object?> row) =>
            DeepWordWithWords(row['word'] as String, row['words'] as String),
        arguments: [word]);
  }

  @override
  Future<WordMeanWithInfo?> getWordMean(String word) async {
    return _queryAdapter.query('SELECT * FROM WordMeanWithInfo WHERE word = ?1',
        mapper: (Map<String, Object?> row) =>
            WordMeanWithInfo(row['word'] as String, row['means'] as String),
        arguments: [word]);
  }

  @override
  Future<List<WordExampleDetail>> getExamples(
    String word,
    int seq,
  ) async {
    return _queryAdapter.queryList(
        'SELECT we.word,          we.example,          we.transfer   FROM word_info wi   INNER JOIN word_mean wm ON wm.word = wi.word   INNER JOIN word_example we ON we.word = wm.word AND we.seq = wm.seq   WHERE wi.\"depth\" = 4     AND we.word = ?1     AND we.seq = ?2',
        mapper: (Map<String, Object?> row) => WordExampleDetail(id: row['id'] as int?, seq: row['seq'] as int, word: row['word'] as String, example: row['example'] as String, transfer: row['transfer'] as String),
        arguments: [word, seq]);
  }

  @override
  Future<void> insertWordInfos(List<WordInfoEntity> wordInfoList) async {
    await _wordInfoEntityInsertionAdapter.insertList(
        wordInfoList, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertWordExamples(
      List<WordExampleEntity> wordExampleList) async {
    await _wordExampleEntityInsertionAdapter.insertList(
        wordExampleList, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertWordMeans(List<WordMeanEntity> wordMeanList) async {
    await _wordMeanEntityInsertionAdapter.insertList(
        wordMeanList, OnConflictStrategy.replace);
  }
}
