class NoteItem{
  int? id;
  String title;
  String content;

//<editor-fold desc="Data Methods">
  NoteItem({
    this.id,
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
      id: id ?? this.id,
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
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
    );
  }

//</editor-fold>
}