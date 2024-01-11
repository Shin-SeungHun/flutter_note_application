import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'enum/custom_colors.dart';

/// 문자열(숫자)를 입력 받아,[ enum CustomColors ] 값의 컬러 값 을 리턴 한다.
/// 예) color: Commons.convertIndexToColor(index: noteItems.getAt(index)!.color.toString()),
class Commons {
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

  static showSnackBar(
      {required BuildContext context, required String message}) {
    try {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      throw Exception(e);
    }
  }
}
