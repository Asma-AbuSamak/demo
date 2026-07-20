import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/widgets/app_card.dart';
import '../controllers/field_ops_controller.dart';

class FieldOpsView extends GetView<FieldOpsController> {
  const FieldOpsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 4.h, right: 4.w),
          child: Text('اختر العملية',
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMuted,
                  letterSpacing: 0.5)),
        ),
        ...controller.ops.map(_opCard),
        SizedBox(height: 80.h),
      ],
    );
  }

  Widget _opCard(OpItem op) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: GestureDetector(
        onTap: () => const {'/op/weight', '/op/medical', '/op/delete', '/protocols', '/op/edit', '/op/add-animal', '/op/birth-breeding'}.contains(op.route)
            ? Get.toNamed(op.route)
            : Get.snackbar('قريباً', 'شاشة «${op.label}» ستُبنى في المرحلة التالية',
                snackPosition: SnackPosition.BOTTOM),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: cardDecoration(),
          child: Row(
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: op.gradient,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(op.icon, color: Colors.white, size: 24.sp),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(op.label,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: AppColors.textMain)),
                    SizedBox(height: 2.h),
                    Text(op.sub,
                        style: TextStyle(
                            fontSize: 11.sp, color: AppColors.textMuted)),
                  ],
                ),
              ),
              Icon(Icons.chevron_left, size: 18.sp, color: const Color(0xFFD1D5DB)),
            ],
          ),
        ),
      ),
    );
  }
}
