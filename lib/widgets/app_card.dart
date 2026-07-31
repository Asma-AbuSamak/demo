import 'package:flutter/material.dart';
import 'package:insighta/styles/theme_x.dart';

BoxDecoration cardDecoration(BuildContext context, {Color? color, BorderRadius? radius, Border? border}) =>
    BoxDecoration(
      color: color ?? context.palette.cardBg,
      borderRadius: radius ?? BorderRadius.circular(20),
      border: border,
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 20, offset: const Offset(0, 4)),
      ],
    );