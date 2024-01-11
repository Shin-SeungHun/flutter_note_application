import 'package:hive/hive.dart';

part 'note_item.g.dart';

@HiveType(typeId: 0)
class NoteItem extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String content;

  @HiveField(3)
  int color;

  @HiveField(4)
  int timeStamp;

//<editor-fold desc="Data Methods">
  NoteItem({
    required this.id,
    required this.title,
    required this.content,
    required this.color,
    required this.timeStamp,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          content == other.content &&
          color == other.color &&
          timeStamp == other.timeStamp);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      content.hashCode ^
      color.hashCode ^
      timeStamp.hashCode;

  @override
  String toString() {
    return 'NoteItem{' +
        ' id: $id,' +
        ' title: $title,' +
        ' content: $content,' +
        ' color: $color,' +
        ' timeStamp: $timeStamp,' +
        '}';
  }

  NoteItem copyWith({
    int? id,
    String? title,
    String? content,
    int? color,
    int? timeStamp,
  }) {
    return NoteItem(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      color: color ?? this.color,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'content': this.content,
      'color': this.color,
      'timeStamp': this.timeStamp,
    };
  }

  factory NoteItem.fromMap(Map<String, dynamic> json) {
    return NoteItem(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      color: json['color'] as int,
      timeStamp: json['timeStamp'] as int,
    );
  }

//</editor-fold>
}
