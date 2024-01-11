import 'package:flutter/material.dart';
import 'package:flutter_note_application/data/model/note_item.dart';
import 'package:flutter_note_application/ui/main/widget/main_background.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My note'),
          actions: [
            IconButton(
              onPressed: () {
                context.push('/detailScreen');
              },
              icon: const Icon(Icons.navigate_next),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go('/detailScreen');
          },
          child: const Icon(Icons.add),
        ),
        body: Stack(
          children: [
            MainBackgorund(),
            noteListWidget(context),
          ],
        ));
  }

  Widget noteListWidget(BuildContext context) {
    List<NoteItem> noteList = List.generate(
        10,
        (index) => NoteItem(
            title: '제목$index',
            content: '내용$index',
            color: 11111,
            timeStamp: 20240111));
    return Positioned(
      top: 10,
      bottom: 10,
      left: 10,
      right: 10,
      child: Container(
        height: MediaQuery.of(context).size.height, // 화면 절반을 차지하도록 설정
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Card(
                color: Colors.brown, // noteList[index].color
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
                              noteList[index].title,
                              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 20),
                           Padding(
                             padding :const EdgeInsets.fromLTRB(0, 0,30,0),
                             child: Text(
                                '${noteList[index].content}일이삼사오육칠팔구십 일이삼사오륙칠팔구이일이이이이일',
                                style: const TextStyle(fontSize: 16.0),
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
                            onPressed: (){},
                            icon: Icon(Icons.restore_from_trash_sharp),
                          ),
                        ),
                      ],
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
