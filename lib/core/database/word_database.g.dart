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
            'CREATE TABLE IF NOT EXISTS `word_mean` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `seq` INTEGER NOT NULL, `word` TEXT NOT NULL, `p_word` TEXT NOT NULL, `mean` TEXT NOT NULL, `bold` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `word_example` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `seq` INTEGER NOT NULL, `word` TEXT NOT NULL, `example` TEXT NOT NULL, `transfer` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `my_word` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `word` TEXT NOT NULL, `word_bold` TEXT NOT NULL, `means` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `word_info` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `depth` INTEGER NOT NULL, `word` TEXT NOT NULL, `bold` TEXT NOT NULL, `p_word` TEXT NOT NULL)');

        await database.execute(
            'CREATE VIEW IF NOT EXISTS `WordWithWords` AS   SELECT \n    t1.word AS word,\n    \'[\' || GROUP_CONCAT(\'\"\' || t2.word || \'\"\') || \']\' AS words\n  FROM (\n    SELECT word \n    FROM word_info \n    WHERE depth = 1\n  ) AS t1\n  INNER JOIN (\n    SELECT word, bold, p_word \n    FROM word_info \n    WHERE depth = 2\n  ) AS t2 \n    ON t2.p_word = t1.word\n  GROUP BY t1.word\n');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `SubWordWithWords` AS   SELECT \n    t1.word AS word,\n    \'[\' || GROUP_CONCAT(\'\"\' || t2.word || \'\"\') || \']\' AS words\n  FROM (\n    SELECT word \n    FROM word_info \n    WHERE depth = 2\n  ) AS t1\n  INNER JOIN (\n    SELECT word, bold, p_word \n    FROM word_info \n    WHERE depth = 3\n  ) AS t2 \n    ON t2.p_word = t1.word\n  GROUP BY t1.word\n');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `DeepWordWithWords` AS   SELECT t1.word,\n         \'[\' || GROUP_CONCAT(\n           \'{\"word\":\"\' || t2.word ||\n           \'\",\"bold\":\"\' || t2.bold ||\n           \'\",\"chk\":\"\' || t2.chk ||\n           \'\",\"means\":\' || t2.means ||\n           \'}\'\n         ) || \']\' AS words\n  FROM (\n    SELECT word \n    FROM word_info \n    WHERE depth = 3\n  ) AS t1\n  INNER JOIN (\n    SELECT wi.word,\n           wi.bold,\n           wi.p_word,\n           CASE \n             WHEN mw.word IS NOT NULL THEN \'Y\'\n             ELSE \'N\'\n           END AS chk,\n           wm.means\n    FROM word_info wi\n    INNER JOIN (\n      SELECT wm.word,\n             \'[\' || GROUP_CONCAT(\n               DISTINCT\n               \'{\"seq\":\"\' || wm.seq ||\n               \'\",\"mean\":\"\' || wm.mean ||\n               \'\",\"bold\":\"\' || wm.bold || \'\"}\'\n             ) || \']\' AS means\n      FROM word_info wi\n      INNER JOIN word_mean wm ON wm.word = wi.word AND wm.p_word = wi.p_word\n      WHERE wi.depth = 4\n      GROUP BY wm.word\n    ) wm ON wm.word = wi.word\n    LEFT OUTER JOIN my_word mw ON mw.word = wi.word\n    WHERE wi.depth = 4\n  ) AS t2 ON t2.p_word = t1.word\n  GROUP BY t1.word\n');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `WordExampleView` AS   SELECT DISTINCT\n         we.word,\n         we.seq,\n         we.example,\n         we.transfer\n  FROM word_info wi\n  INNER JOIN word_mean wm ON wm.word = wi.word\n  INNER JOIN word_example we ON we.word = wm.word AND we.seq = wm.seq\n  WHERE wi.\"depth\" = 4\n');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `MyWordInsertView` AS   SELECT DISTINCT\n         w4.word AS word,\n         w4.bold AS word_bold,\n         wm.p_word AS p_word,\n         wm.means AS means\n  FROM word_info w1\n  INNER JOIN word_info w2 ON w2.p_word = w1.word AND w2.depth = 2\n  INNER JOIN word_info w3 ON w3.p_word = w2.word AND w3.depth = 3\n  INNER JOIN word_info w4 ON w4.p_word = w3.word AND w4.depth = 4\n  INNER JOIN (\n    SELECT wm.word,\n           wm.p_word,\n           \'[\' || GROUP_CONCAT(\n             \'{\"seq\":\"\' || wm.seq || \'\",\"mean\":\"\' || wm.mean || \'\",\"bold\":\"\' || wm.bold || \'\"}\'\n           ) || \']\' AS means\n    FROM word_info wi\n    INNER JOIN word_mean wm ON wm.word = wi.word AND wm.p_word = wi.p_word\n    WHERE wi.depth = 4\n    GROUP BY wm.word, wm.p_word\n  ) wm ON wm.word = w4.word AND wm.p_word = w4.p_word\n  WHERE w1.depth = 1\n');

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
                  'p_word': item.p_word,
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
  Future<List<WordExampleView>> getExamples(String word) async {
    return _queryAdapter.queryList(
        'SELECT * FROM WordExampleView WHERE word = ?1',
        mapper: (Map<String, Object?> row) => WordExampleView(
            row['word'] as String,
            row['seq'] as int,
            row['example'] as String,
            row['transfer'] as String),
        arguments: [word]);
  }

  @override
  Future<void> insertMyWord(
    String word,
    String pWord,
  ) async {
    await _queryAdapter.queryNoReturn(
        'INSERT INTO my_word (word, word_bold, means)   SELECT word, word_bold, means   FROM MyWordInsertView   WHERE word = ?1     AND p_word = ?2',
        arguments: [word, pWord]);
  }

  @override
  Future<void> deleteMyWord(
    String word,
    String bold,
  ) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM my_word   WHERE word = ?1    AND word_bold = ?2',
        arguments: [word, bold]);
  }

  @override
  Future<List<MyWordEntity>> getMyWord() async {
    return _queryAdapter.queryList('SELECT * FROM my_word',
        mapper: (Map<String, Object?> row) => MyWordEntity(
            id: row['id'] as int?,
            word: row['word'] as String,
            word_bold: row['word_bold'] as String,
            means: row['means'] as String));
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
