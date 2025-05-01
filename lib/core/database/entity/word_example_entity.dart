
import 'package:floor/floor.dart';

@Entity(tableName: 'word_example')
class WordExampleEntity {

  @PrimaryKey(autoGenerate: true)
  final int? id;


  final int seq;
  final String word;
  final String example;
  final String p_word;
  final String transfer;

  //<editor-fold desc="Data Methods">
  const WordExampleEntity({
    this.id,
    required this.seq,
    required this.word,
    required this.example,
    required this.p_word,
    required this.transfer,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordExampleEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          seq == other.seq &&
          word == other.word &&
          example == other.example &&
          p_word == other.p_word &&
          transfer == other.transfer);

  @override
  int get hashCode =>
      id.hashCode ^
      seq.hashCode ^
      word.hashCode ^
      example.hashCode ^
      p_word.hashCode ^
      transfer.hashCode;

  @override
  String toString() {
    return 'WordExampleEntity{' +
        ' id: $id,' +
        ' seq: $seq,' +
        ' word: $word,' +
        ' example: $example,' +
        ' p_word: $p_word,' +
        ' transfer: $transfer,' +
        '}';
  }

  WordExampleEntity copyWith({
    int? id,
    int? seq,
    String? word,
    String? example,
    String? p_word,
    String? transfer,
  }) {
    return WordExampleEntity(
      id: id ?? this.id,
      seq: seq ?? this.seq,
      word: word ?? this.word,
      example: example ?? this.example,
      p_word: p_word ?? this.p_word,
      transfer: transfer ?? this.transfer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'seq': this.seq,
      'word': this.word,
      'example': this.example,
      'p_word': this.p_word,
      'transfer': this.transfer,
    };
  }

  factory WordExampleEntity.fromMap(Map<String, dynamic> map) {
    return WordExampleEntity(
      seq: map['seq'] as int,
      word: map['word'] as String,
      example: map['example'] as String,
      p_word: map['p_word'] as String,
      transfer: map['transfer'] as String,
    );
  }

  //</editor-fold>
}