import 'dart:math';
import 'dart:core';

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
    int newId = await findUniqueNoteId();

    await noteItems.add(NoteItem(
      title: title,
      content: content,
      color: color,
      timeStamp: timeStamp,
      id: newId,
    ));
  }

  /// id 리스트를 조회하여, 가장 큰수의 +1 한 값을 id로 생성.
  int findUniqueNoteId() {
    int newId = noteItems.values.length;

    if (newId > 0) {
      List<int> getIdList = noteItems.values.map((item) => item.id).toList();
      int maxValue = getIdList.reduce((previousValue, element) => max(previousValue, element));
      return newId = maxValue + 1;
    } else {
      return newId;
    }
  }
}

