import 'package:flutter/material.dart';

enum CustomColors {
  roseBud,
  primrose,
  wisteria,
  skyBlue,
  illusion,
}

extension CustomColorsExtension on CustomColors {
  static CustomColors colorFromIndex(int index) {
    return CustomColors.values[index - 1];
  }

  int get indexValue => this.index + 1;

  Color get colorValue {
    switch (this) {
      case CustomColors.roseBud:
        return const Color(0xFFFFAB91);
      case CustomColors.primrose:
        return const Color(0xFFE7ED9B);
      case CustomColors.wisteria:
        return const Color(0xFFCF94DA);
      case CustomColors.skyBlue:
        return const Color(0xFF81DEEA);
      case CustomColors.illusion:
        return const Color(0xFFF48FB1);
    }
  }
}

/// *** index 얻기
/// print(CustomColors.roseBud.indexValue)를 호출 ->  1 이 출력,
/// print(CustomColors.primrose.indexValue)를 호출 ->  2 가 출력

/// *** index로 color얻기
/// CustomColorsExtension.colorFromIndex(1).colorValue -> CustomColors.roseBud 값 반환
