
import 'package:floor/floor.dart';

@Entity(tableName: 'word_info')
class WordInfoEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final int depth;
  final String word;
  final String bold;
  final String p_word;

  //<editor-fold desc="Data Methods">
  const WordInfoEntity({
    required this.id,
    required this.depth,
    required this.word,
    required this.bold,
    required this.p_word,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordInfoEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          depth == other.depth &&
          word == other.word &&
          bold == other.bold &&
          p_word == other.p_word);

  @override
  int get hashCode =>
      id.hashCode ^
      depth.hashCode ^
      word.hashCode ^
      bold.hashCode ^
      p_word.hashCode;

  @override
  String toString() {
    return 'WordInfoEntity{' +
        ' id: $id,' +
        ' depth: $depth,' +
        ' word: $word,' +
        ' bold: $bold,' +
        ' p_word: $p_word,' +
        '}';
  }

  WordInfoEntity copyWith({
    int? id,
    int? depth,
    String? word,
    String? bold,
    String? p_word,
  }) {
    return WordInfoEntity(
      id: id ?? this.id,
      depth: depth ?? this.depth,
      word: word ?? this.word,
      bold: bold ?? this.bold,
      p_word: p_word ?? this.p_word,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'depth': this.depth,
      'word': this.word,
      'bold': this.bold,
      'p_word': this.p_word,
    };
  }

  factory WordInfoEntity.fromMap(Map<String, dynamic> map) {
    return WordInfoEntity(
      id: null,
      depth: map['depth'] as int,
      word: map['word'] as String,
      bold: map['bold'] as String,
      p_word: map['p_word'] as String,
    );
  }

  //</editor-fold>
}