import 'package:flutter/material.dart';
import 'package:flutter_note_application/data/model/note_item.dart';
import 'package:flutter_note_application/main.dart';
import 'package:flutter_note_application/utils/enum/custom_colors.dart';

class EditViewModel extends ChangeNotifier {
  final int? id;

  EditViewModel({
    this.id,
  });


  Future<void> editNote({
    required int? id,
    required String title,
    required String content,
    required int color,
  }) async {
    if (id != null) {
      await noteItems.putAt(
        id,
        NoteItem(
          title: title,
          content: content,
          color: color,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
          id: id,
        ),
      );
    }
  }


}
