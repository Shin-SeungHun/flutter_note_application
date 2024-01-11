import 'package:flutter/material.dart';
import 'package:flutter_note_application/data/model/note_item.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'router/routes.dart';

void main() async {
  await Hive.initFlutter();
  
  Box<NoteItem> box = await Hive.openBox<NoteItem>('note.db');


  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'note app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
