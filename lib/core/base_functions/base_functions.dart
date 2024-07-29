import 'package:flutter/material.dart';
import 'package:manfaa/core/theme/colors/app_colors.dart';

class BaseFunctions {
  static Color paintTableRow(int index, int columnLength) {
    final row = calculateRowIndex(index, columnLength);
    final column = BaseFunctions.calculateColumnIndex(index, 3);
    switch (row) {
      case 0:
        return column == 0 ? Colors.transparent : AppColors.eecb63;
      case 1 || 3:
        return Colors.white;
      case 2 || 4:
        return AppColors.fdf8e5;
      default:
        return Colors.transparent;
    }
  }

  static int calculateRowIndex(int index, int columnLength) {
    return (index / columnLength).floor();
  }

  static int calculateColumnIndex(int index, int columnLength) {
    return index % columnLength;
  }
}
