import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/widgets/animal_form_fields.dart';
import 'package:insighta/widgets/app_field.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/widgets/gradient_button.dart';
import 'package:insighta/widgets/saved_overlay.dart';

import '../controllers/add_op_controller.dart';

class AddOpView extends GetView<AddOpController> {
  const AddOpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Column(
        children: [
          const BackHeader(title: 'إضافة خروف جديد'),
          Obx(() => controller.step.value == AddStep.saved
              ? const SizedBox.shrink()
              : _stepper()),
          Expanded(
            child: Obx(() {
              switch (controller.step.value) {
                case AddStep.rfid:
                  return _rfidStep();
                case AddStep.details:
                  return _detailsStep();
                case AddStep.saved:
                  return const SavedOverlay(message: 'تمت إضافة الخروف بنجاح');
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _stepper() {
    final onDetails = controller.step.value == AddStep.details;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _stepDot('1', 'رقم الشريحة', true),
          Container(width: 40.w, height: 2.h, color: onDetails ? AppColors.primary : AppColors.border),
          _stepDot('2', 'البيانات', onDetails),
        ],
      ),
    );
  }

  Widget _stepDot(String n, String label, bool active) {
    return Row(children: [
      Text(label,
          style: TextStyle(
              fontSize: 11.sp,
              color: active ? AppColors.primaryDark : AppColors.textMuted,
              fontWeight: FontWeight.w600)),
      SizedBox(width: 6.w),
      Container(
        width: 22.w,
        height: 22.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: active ? AppColors.primaryDark : AppColors.border,
            shape: BoxShape.circle),
        child: Text(n,
            style: TextStyle(
                color: active ? Colors.white : AppColors.textMuted,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold)),
      ),
    ]);
  }

  Widget _rfidStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Obx(() => GestureDetector(
                onTap: controller.scanning.value ? null : controller.scan,
                child: Container(
                  width: 120.w,
                  height: 120.w,
                  decoration: BoxDecoration(
                    color: AppColors.accentLight,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                  child: controller.scanning.value
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.qr_code_scanner,
                                size: 40.sp, color: AppColors.primaryDark),
                            SizedBox(height: 6.h),
                            Text('مسح بالجهاز',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDark)),
                          ],
                        ),
                ),
              )),
          SizedBox(height: 10.h),
          Text('أو أدخل يدوياً',
              style: TextStyle(fontSize: 12.sp, color: AppColors.textMuted)),
          SizedBox(height: 16.h),
          AppField(
            label: 'ID الشريحة',
            child: TextField(
              controller: controller.idCtrl,
              decoration: appInputDecoration('مثال : RF-011'),
            ),
          ),
          SizedBox(height: 20.h),
          Obx(() => GradientButton(
                label: 'التالي - إدخال البيانات  ←',
                enabled: controller.canNext,
                onTap: controller.next,
              )),
        ],
      ),
    );
  }

  Widget _detailsStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(() => Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.accentLight,
                  border: Border.all(color: const Color(0xFFA7F3D0)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(children: [
                  Icon(Icons.qr_code_2, size: 18.sp, color: AppColors.emeraldFg),
                  SizedBox(width: 8.w),
                  Text('الشريحة: ${controller.idValue.value}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          color: AppColors.emeraldFg)),
                ]),
              )),
          SizedBox(height: 14.h),
          AnimalFormFields(form: controller.form),
          SizedBox(height: 20.h),
          GradientButton(
            label: 'حفظ الخروف',
            icon: Icons.check,
            onTap: controller.save,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
