import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import '../../data/model/note_item.dart';

class MainViewModel extends ChangeNotifier {
  late Box<NoteItem> items;

  MainViewModel() {
    init();
  }

  Future<void> init() async {
    items  = await Hive.openBox<NoteItem>('note.db');
  }
}
