import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insighta/styles/app_colors.dart';

/// هيدر بتدرّج أخضر مع زر رجوع (يقابل BackHeader).
class BackHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onBack;

  const BackHeader({super.key, required this.title, this.subtitle, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 40.h, bottom: 20.h, left: 16.w, right: 16.w),
      decoration: const BoxDecoration(gradient: AppColors.headerGradient),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onBack ?? () => Get.back(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_forward, color: Colors.white70, size: 16.sp),
                SizedBox(width: 4.w),
                Text('رجوع',
                    style: TextStyle(color: Colors.white70, fontSize: 13.sp)),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold)),
          if (subtitle != null)
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Text(subtitle!,
                  style: TextStyle(color: Colors.white60, fontSize: 12.sp)),
            ),
        ],
      ),
    );
  }
}