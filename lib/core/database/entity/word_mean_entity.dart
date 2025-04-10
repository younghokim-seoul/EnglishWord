
import 'package:floor/floor.dart';

@Entity(tableName: 'word_mean')
class WordMeanEntity {

  @PrimaryKey(autoGenerate: true)
  final int? id;

  final int seq;
  final String word;
  final String mean;
  final String bold;

  //<editor-fold desc="Data Methods">
  const WordMeanEntity({
    this.id,
    required this.seq,
    required this.word,
    required this.mean,
    required this.bold,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordMeanEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          seq == other.seq &&
          word == other.word &&
          mean == other.mean &&
          bold == other.bold);

  @override
  int get hashCode =>
      id.hashCode ^
      seq.hashCode ^
      word.hashCode ^
      mean.hashCode ^
      bold.hashCode;

  @override
  String toString() {
    return 'WordMeanEntity{' +
        ' id: $id,' +
        ' seq: $seq,' +
        ' word: $word,' +
        ' mean: $mean,' +
        ' bold: $bold,' +
        '}';
  }

  WordMeanEntity copyWith({
    int? id,
    int? seq,
    String? word,
    String? mean,
    String? bold,
  }) {
    return WordMeanEntity(
      id: id ?? this.id,
      seq: seq ?? this.seq,
      word: word ?? this.word,
      mean: mean ?? this.mean,
      bold: bold ?? this.bold,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'seq': this.seq,
      'word': this.word,
      'mean': this.mean,
      'bold': this.bold,
    };
  }

  factory WordMeanEntity.fromMap(Map<String, dynamic> map) {
    return WordMeanEntity(
      id: map.containsKey('id') ? map['id'] as int : null,
      seq: map['seq'] as int,
      word: map['word'] as String,
      mean: map['mean'] as String,
      bold: map['bold'] as String,
    );
  }

  //</editor-fold>
}