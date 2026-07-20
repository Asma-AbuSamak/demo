import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/styles/app_colors.dart';

/// زر بتدرّج أخضر (يُستخدم في الحفظ). يتحوّل رمادياً عند التعطيل.
class GradientButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback onTap;//الوظيفة اللي بتتنفذ لما اضغط على الزر
  final IconData? icon;

  const GradientButton({
    super.key,
    required this.label,
    required this.onTap,
    this.enabled = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(//بتستقبل حدث الضغط على الزر
      onTap: enabled ? onTap : null,//لو الزر مفعل، نفّذ الوظيفة onTap، لو لا، ما تعمل شي
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          gradient: enabled ? AppColors.headerGradient : null,
          color: enabled ? null : const Color(0xFFB8C2CC),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.white, size: 18.sp),
              SizedBox(width: 8.w),
            ],
            Text(label,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}