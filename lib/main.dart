import 'package:flutter/material.dart';
import 'package:flutter_note_application/data/model/note_item.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'router/routes.dart';

late final Box<NoteItem> noteItems;

void main() async {
  await init();

  runApp(const MyApp());
}

Future<void> init() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteItemAdapter());
  noteItems = await Hive.openBox<NoteItem>('note.db');
  print('All items in noteItems box:');
  for (var key in noteItems.keys) {
    var item = noteItems.get(key);
    print('item ${item?.timeStamp.runtimeType}');
    print('noteItems ${noteItems.keys};');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'note app',
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.indigo),
          ))),
      themeMode: ThemeMode.dark,
    );
  }
}
