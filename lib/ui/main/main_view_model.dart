import 'package:flutter/material.dart';
import 'package:flutter_note_application/data/model/note_item.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../main.dart';

class MainViewModel extends ChangeNotifier {
  late Box<NoteItem> noteDB;
  List<NoteItem> noteList = [];

  MainViewModel() {
    init();
  }

  Future<void> init() async {
    try {
      noteList = [];
      noteDB = noteItems;

      noteList.addAll([...noteDB.values.whereType<NoteItem>()]);

      print([...noteDB.values.whereType<NoteItem>()]);

      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  /// 노트 아이템 삭제
  Future<bool?> delete({required int index}) async {
    try {
      NoteItem? getItem = findItem(index: index);

      if (getItem != null) {
        print('삭제할 아이템: $getItem');
        await noteDB.delete(getItem.key);
        init();
        return true;
      }
    } catch (e) {
      // print(e);
      init();
      return false;
    }
  }

  /// 노트 아이템 검색
  NoteItem? findItem({required int index}) => noteDB.getAt(index);
}
