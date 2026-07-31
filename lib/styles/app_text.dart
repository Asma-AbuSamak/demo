import 'package:flutter/material.dart';


class AppTextStyles {
  static const String? fontFamily = null;//خط فلتر الافتراضي

  static TextTheme textTheme(TextTheme base) => base.apply(fontFamily: fontFamily);
}
