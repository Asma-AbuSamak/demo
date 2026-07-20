import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/styles/app_colors.dart';
import 'app_field.dart';

/// حقل إدخال ID مع زر مسح (سكانر) ونبضة أثناء المسح.
class ScanIdInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback onScan;
  final bool scanning;

  const ScanIdInput({
    super.key,
    required this.label,
    required this.controller,
    required this.onScan,
    this.scanning = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppField(
      label: label,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: appInputDecoration('اكتب الـ ID أو امسح'),
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: scanning ? null : onScan,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: scanning ? AppColors.accentGreen : AppColors.primaryDark,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.qr_code_scanner,
                color: scanning ? AppColors.primary : Colors.white,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}