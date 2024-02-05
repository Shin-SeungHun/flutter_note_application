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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.black),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            // 테두리를 변경하는 부분
            borderRadius: BorderRadius.circular(20.0), // 원하는 테두리 모양 및 반지름 지정
            side: const BorderSide(color: Colors.black45, width: 2.0),
          ),
        ),
      );
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

  /// 기능: ( 예 / 아니오 ) alert 다이얼로그
  /// 예)  bool? result = await showCustomDialog( context: context, title: '종료', content: '종료하시겠습니까?' );
  static Future<bool?> onAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) async {
    return  await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: const Text('예'),
              onPressed: () {
                Navigator.of(context).pop(true);  // 다이얼로그를 닫고, true 값을 반환
              },
            ),
            TextButton(
              child: const Text('아니오'),
              onPressed: () {
                Navigator.of(context).pop(false);  // 다이얼로그를 닫고, false 값을 반환
              },
            ),
          ],
        );
      },
    );
  }
}
