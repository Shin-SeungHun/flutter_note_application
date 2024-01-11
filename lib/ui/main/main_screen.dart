import 'package:flutter/material.dart';
import 'package:flutter_note_application/ui/main/widget/main_background.dart';
import 'package:flutter_note_application/utils/commons.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import '../../utils/enum/custom_colors.dart';

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
            context.push('/detailScreen');
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
    print(noteItems);

    print(CustomColors.roseBud.indexValue);
    print(CustomColors.primrose.indexValue);
    print(CustomColorsExtension.colorFromIndex(1).colorValue);


    return Positioned(
      top: 10,
      bottom: 10,
      left: 10,
      right: 10,
      child: Container(
        height: MediaQuery.of(context).size.height, // 화면 절반을 차지하도록 설정
        child: ListView.builder(
          itemCount: noteItems.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              // 데이터 없음.
              return const SizedBox();
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: InkWell(
                  onTap: () {
                    context.push('/detailScreen/${noteItems.getAt(index)?.id}');
                  },
                  child: Card(
                    color: Commons.convertIndexToColor(index: noteItems.getAt(index)!.color.toString()),
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
                                  noteItems.getAt(index)?.title.toString() ??
                                      '',
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                  child: Text(
                                    noteItems
                                            .getAt(index)
                                            ?.content
                                            .toString() ??
                                        '',
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
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.restore_from_trash_sharp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } // else
          },
        ),
      ),
    );
  }
}
