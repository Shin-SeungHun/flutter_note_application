import 'package:flutter/material.dart';
import 'package:flutter_note_application/data/model/note_item.dart';
import 'package:flutter_note_application/main.dart';
import 'package:flutter_note_application/utils/enum/custom_colors.dart';

class AddViewModel extends ChangeNotifier {
  CustomColors _selectedColor = CustomColors.roseBud;

  CustomColors get selectedColor => _selectedColor;

  void fetchSelectedColor({required CustomColors color}) {
    _selectedColor = color;
    notifyListeners();
  }

  Future<void> saveNote({
    required String title,
    required String content,
    required int color,
    required int timeStamp,
  }) async {
    await noteItems.add(NoteItem(
      title: title,
      content: content,
      color: color,
      timeStamp: timeStamp,
      id: noteItems.values.length,
    ));
  }
}
