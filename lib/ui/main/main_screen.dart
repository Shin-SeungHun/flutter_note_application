import 'package:flutter/material.dart';
import 'package:flutter_note_application/ui/main/widget/main_background.dart';
import 'package:flutter_note_application/ui/main/widget/note_list_widget.dart';
import 'package:flutter_note_application/utils/commons.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:flutter_note_application/main.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: const Text('My note'),
          actions: [
            const SizedBox(
              height: kToolbarHeight, // 앱 바의 높이로 설정
              width: kToolbarHeight, // 앱 바의 높이로 설정
              child: Stack(
                children: [

                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: RiveAnimation.asset(
                      'assets/rive/cat.riv', fit: BoxFit.fill,),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () async {
                await noteItems.clear();
                setState(() {
                  Commons.showSnackBar(context: context, message: '전체 삭제!');
                });
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await context.push('/addScreen');
          },
          child:
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                RiveAnimation.asset(
                  'assets/rive/message_write.riv', fit: BoxFit.fill,),
              ],
            ),
          ),
        ),
        body: const Stack(
          children: [
            /// 백그라운드 설정
            MainBackgorund(),
            /// 노트 리스트
            NoteListWidget(),
          ],
        ));
  }
}
