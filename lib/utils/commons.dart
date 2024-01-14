import 'package:flutter/material.dart';
import 'package:flutter_note_application/utils/enum/custom_colors.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class Commons {
  /// 문자열(숫자)를 입력 받아,[ enum CustomColors ] 값의 컬러 값 을 리턴 한다.
  /// 예) color: Commons.convertIndexToColor(index: noteItems.getAt(index)!.color.toString()),
  static convertIndexToColor({required String index}) {
    try {
      int colorIndex = int.parse(index);
      Color memoColors =
          CustomColorsExtension.colorFromIndex(colorIndex).colorValue;
      return memoColors;
    } catch (e) {
      return const Color(0xFFFFAB91);
    }
  }

  /// TODO: 1. success 성공-그린,  2.info 공지-연파랑  3. 경고 warring-주황  4. error-빨간
  static showSnackBar(
      {required BuildContext context, required String message}) {
    try {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      throw Exception(e);
    }
  }

  /// 숫자를 입력 받아, String 값의 날짜를 리턴한다.
  /// 예) Text(Commons.convertTime(timeStamp:  noteItems.getAt(index)!.timeStamp,),)
  static String convertTime({required int timeStamp}) {
    try {
      initializeDateFormatting('ko_KR', null);
      DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp);
      DateFormat formatter = DateFormat('yyyy.M.d(E) H:m:s', 'ko_KR');
      return formatter.format(date);
    } catch (e) {
      return 'N/A';
    }
  }
}
