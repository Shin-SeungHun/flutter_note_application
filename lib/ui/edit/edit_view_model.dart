import 'package:flutter/material.dart';
import 'package:flutter_note_application/data/model/note_item.dart';
import 'package:flutter_note_application/main.dart';
import 'package:flutter_note_application/utils/enum/custom_colors.dart';

class EditViewModel extends ChangeNotifier {
  final int? id;

  EditViewModel({
    this.id,
  });


  Future<void> editNote({
    required int? id,
    required String title,
    required String content,
    required int color,
  }) async {
    if (id != null) {

      /// 검색, id ,유효한 값으로 조회한다.
      /// 삭제, [검색] 기능으로 조회해 온 데이터를 있으면 삭제한다.
      /// 수정, [검색] 기능으로 조회해 온 데이터가 있으면, 그 데이터에 수정 할 데이터를 변경한다.

      final getItems = noteItems.values.firstWhere((item) => item.id == id);
      final index = noteItems.values.toList().indexOf(getItems);

      if (getItems != null) {
        getItems
          ..id = id
          ..title = title
          ..content = content
          ..color = color
          ..timeStamp = DateTime.now().millisecondsSinceEpoch
        ;

        /// id가 아닌 index 를 첫번째 인자로 전달 해야 한다.
        await noteItems.putAt(index, getItems);

      }
    }
  }

}
