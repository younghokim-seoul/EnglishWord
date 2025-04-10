import 'package:floor/floor.dart';

@Entity(tableName: 'my_word')
class MyWordEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String depth_word_1;
  final String depth_word_2;
  final String depth_word_3;
  final String depth_word_4;
  final String mean;

  //<editor-fold desc="Data Methods">
  const MyWordEntity({
    this.id,
    required this.depth_word_1,
    required this.depth_word_2,
    required this.depth_word_3,
    required this.depth_word_4,
    required this.mean,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyWordEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          depth_word_1 == other.depth_word_1 &&
          depth_word_2 == other.depth_word_2 &&
          depth_word_3 == other.depth_word_3 &&
          depth_word_4 == other.depth_word_4 &&
          mean == other.mean);

  @override
  int get hashCode =>
      id.hashCode ^
      depth_word_1.hashCode ^
      depth_word_2.hashCode ^
      depth_word_3.hashCode ^
      depth_word_4.hashCode ^
      mean.hashCode;

  @override
  String toString() {
    return 'MyWordEntity{' +
        ' id: $id,' +
        ' depth_word_1: $depth_word_1,' +
        ' depth_word_2: $depth_word_2,' +
        ' depth_word_3: $depth_word_3,' +
        ' depth_word_4: $depth_word_4,' +
        ' mean: $mean,' +
        '}';
  }

  MyWordEntity copyWith({
    int? id,
    String? depth_word_1,
    String? depth_word_2,
    String? depth_word_3,
    String? depth_word_4,
    String? mean,
  }) {
    return MyWordEntity(
      id: id ?? this.id,
      depth_word_1: depth_word_1 ?? this.depth_word_1,
      depth_word_2: depth_word_2 ?? this.depth_word_2,
      depth_word_3: depth_word_3 ?? this.depth_word_3,
      depth_word_4: depth_word_4 ?? this.depth_word_4,
      mean: mean ?? this.mean,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'depth_word_1': this.depth_word_1,
      'depth_word_2': this.depth_word_2,
      'depth_word_3': this.depth_word_3,
      'depth_word_4': this.depth_word_4,
      'mean': this.mean,
    };
  }

  factory MyWordEntity.fromMap(Map<String, dynamic> map) {
    return MyWordEntity(
      id: map.containsKey('id') ? map['id'] as int : null,
      depth_word_1: map['depth_word_1'] as String,
      depth_word_2: map['depth_word_2'] as String,
      depth_word_3: map['depth_word_3'] as String,
      depth_word_4: map['depth_word_4'] as String,
      mean: map['mean'] as String,
    );
  }

  //</editor-fold>
}
