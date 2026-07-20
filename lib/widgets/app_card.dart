import 'package:flutter/material.dart';

/// نمط البطاقة البيضاء الموحّد 
///  هو الشكل البصري الموحّد لأي "صندوق محتوى" بالتطبيق كله
/// برجع BoxDecoration
BoxDecoration cardDecoration({Color? color, BorderRadius? radius, Border? border}) =>
    BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: radius ?? BorderRadius.circular(20),
      border: border,
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 20, offset: const Offset(0, 4)),
      ],
    );