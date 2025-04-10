
import 'package:floor/floor.dart';

@Entity(tableName: 'word_example')
class WordExampleEntity {

  @PrimaryKey(autoGenerate: true)
  final int? id;


  final int seq;
  final String word;
  final String example;

  final String transfer;

  //<editor-fold desc="Data Methods">
  const WordExampleEntity({
    this.id,
    required this.seq,
    required this.word,
    required this.example,
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
          transfer == other.transfer);

  @override
  int get hashCode =>
      id.hashCode ^
      seq.hashCode ^
      word.hashCode ^
      example.hashCode ^
      transfer.hashCode;

  @override
  String toString() {
    return 'WordExampleEntity{' +
        ' id: $id,' +
        ' seq: $seq,' +
        ' word: $word,' +
        ' example: $example,' +
        ' transfer: $transfer,' +
        '}';
  }

  WordExampleEntity copyWith({
    int? id,
    int? seq,
    String? word,
    String? example,
    String? transfer,
  }) {
    return WordExampleEntity(
      id: id ?? this.id,
      seq: seq ?? this.seq,
      word: word ?? this.word,
      example: example ?? this.example,
      transfer: transfer ?? this.transfer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'seq': this.seq,
      'word': this.word,
      'example': this.example,
      'transfer': this.transfer,
    };
  }

  factory WordExampleEntity.fromMap(Map<String, dynamic> map) {
    return WordExampleEntity(
      id: map.containsKey('id') ? map['id'] as int : null,
      seq: map['seq'] as int,
      word: map['word'] as String,
      example: map['example'] as String,
      transfer: map['transfer'] as String,
    );
  }

  //</editor-fold>
}