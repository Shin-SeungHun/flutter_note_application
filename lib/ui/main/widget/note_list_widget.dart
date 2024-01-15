import 'package:flutter/material.dart';
import 'package:flutter_note_application/ui/main/main_view_model.dart';
import 'package:flutter_note_application/utils/commons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';

class NoteListWidget extends StatefulWidget {
  const NoteListWidget({super.key});

  @override
  State<NoteListWidget> createState() => _NoteListWidgetState();
}

class _NoteListWidgetState extends State<NoteListWidget> {
  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    final _gridViewKey = GlobalKey();

    MainViewModel mainViewModel = context.watch<MainViewModel>();

    final List<Widget> generatedChildren =
    mainViewModel.noteList.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      /// 노트 리스트 - 그리드 UI 설정
      return
        Padding(
          key: Key(item.id.toString()),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: InkWell(
            onTap: () {
              print('${item.id.toString()}');
              context.push('/editScreen/${item.id.toString()}');
            },
            child:
            Card(
              color: (Commons.convertIndexToColor(index: item.color.toString()) as Color)
                  .withOpacity(0.8),
              child: Container(
                color: Colors.transparent, // 투명한 배경색으로 설정
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              item.title.toString() ?? '',
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Spacer(),
                          /// timeStamp
                          SizedBox(
                            width: 80,
                            child: Text(
                              Commons.convertTime(timeStamp: item.timeStamp) ?? '',
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          /// content
                          SizedBox(
                            width: 240,
                            child: Text(
                              mainViewModel.noteList[index].content.toString() ?? '',
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          const Spacer(),
                          /// content
                          SizedBox(
                            width: 30,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: IconButton(
                                onPressed: () async {
                                  bool? isConfirm = await Commons.onAlertDialog(
                                    context: context,
                                    title: '삭제',
                                    content: '삭제 하시겠습니까?',
                                  );

                                  if (isConfirm != null && isConfirm) {
                                    bool? result = await mainViewModel.delete(index: index);

                                    result != null
                                        ? await Commons.showSnackBar(context: context, message: '삭제 되었습니다.')
                                        : await Commons.showSnackBar(context: context, message: '삭제 실패.');
                                  }
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );


    }).toList();

    /// Reorderable 설정
    return ReorderableBuilder(
      automaticScrollExtent: 10,
      scrollController: _scrollController,
      onReorder: (List<OrderUpdateEntity> orderUpdateEntities) {
        for (final orderUpdateEntity in orderUpdateEntities) {
          final item =
          mainViewModel.noteList.removeAt(orderUpdateEntity.oldIndex);
          mainViewModel.noteList.insert(orderUpdateEntity.newIndex, item);
        }
      },
      builder: (children) {
        return GridView(
          key: _gridViewKey,
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // 가로 개수
            childAspectRatio: (1 / .5), // 그리드 1칸 사이즈
            mainAxisSpacing: 0, // 간격
            crossAxisSpacing: 0,
          ),
          children: children,
        );
      },
      children: generatedChildren,
    );
  }
}
