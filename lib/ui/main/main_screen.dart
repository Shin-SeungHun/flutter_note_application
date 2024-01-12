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

class NoteListWidget extends StatefulWidget {
  const NoteListWidget({super.key});
  @override
  State<NoteListWidget> createState() => _NoteListWidgetState();
}

class _NoteListWidgetState extends State<NoteListWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      bottom: 10,
      left: 10,
      right: 10,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: noteItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: InkWell(
                onTap: () {
                  context.push('/editScreen/${noteItems.getAt(index)?.id}');
                },
                child: Card(
                  color: Commons.convertIndexToColor(
                      index: noteItems.getAt(index)!.color.toString()),
                  child: Container(
                    color: Colors.transparent, // 투명한 배경색으로 설정
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                noteItems.getAt(index)?.title.toString() ?? '',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                child: Text(
                                  noteItems.getAt(index)?.content.toString() ??
                                      '',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 40,
                            bottom: 0,
                            right: -10,
                            child:
                            IconButton(
                              onPressed: () async {
                                await noteItems.deleteAt(index);
                                setState(() {
                                  Commons.showSnackBar(
                                      context: context, message: '삭제 되었습니다.');
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}






