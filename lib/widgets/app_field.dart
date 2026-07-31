import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/styles/theme_x.dart';

/// حقل بعنوان صغير أعلاه 
/// شكل العناوين 
class AppField extends StatelessWidget {
  final String label;
  final Widget child;
  const AppField({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 6.h),
          child: Text(
            label,//النص اللي فوق الحقل
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: context.palette.textMuted,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

/// نمط موحّد لحقول الإدخال 
/// جوا البوكس 
InputDecoration appInputDecoration(BuildContext context, String hint) => InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: context.palette.pageBg,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: context.palette.border),
      ),
      //لما اضغط
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: context.colors.primary, width: 1.5),
      ),
    );