import 'package:hive/hive.dart';

part 'note_item.g.dart';

@HiveType(typeId: 0)
class NoteItem extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String content;

//<editor-fold desc="Data Methods">
  NoteItem({
    required this.title,
    required this.content,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          content == other.content);

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ content.hashCode;

  @override
  String toString() {
    return 'NoteItem{ id: $id, title: $title, content: $content,}';
  }

  NoteItem copyWith({
    int? id,
    String? title,
    String? content,
  }) {
    return NoteItem(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }

  factory NoteItem.fromMap(Map<String, dynamic> json) {
    return NoteItem(
      title: json['title'] as String,
      content: json['content'] as String,
    );
  }

//</editor-fold>
}
