import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/widgets/animal_badge.dart';
import 'package:insighta/widgets/app_field.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/widgets/custom_select.dart';
import 'package:insighta/widgets/saved_overlay.dart';
import 'package:insighta/widgets/scan_id_input.dart';
import 'package:insighta/models/med_record.dart';
import '../controllers/medical_op_controller.dart';

class MedicalOpView extends GetView<MedicalOpController> {
  const MedicalOpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Column(
        children: [
          const BackHeader(title: 'تسجيل علاج / فحص'),
          Expanded(
            child: Obx(() {
              switch (controller.step.value) {
                case MedStep.scanId:
                  return _scanStep();
                case MedStep.form:
                  return _formStep();
                case MedStep.saved:
                  return const SavedOverlay(message: 'تم تسجيل السجل الطبي بنجاح');
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _scanStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Obx(() => ScanIdInput(
                label: 'ID الخروف',
                controller: controller.idCtrl,
                onScan: controller.scan,
                scanning: controller.scanning.value,
              )),
          SizedBox(height: 16.h),
          Obx(() => _primaryButton(
                label: 'بحث',
                enabled: controller.canSearch,
                onTap: controller.search,
              )),
          Obx(() => controller.notFound.value
              ? Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Text('لا يوجد خروف بهذا الـ ID',
                      style: TextStyle(color: AppColors.redFg, fontSize: 12.sp)),
                )
              : const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _formStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimalBadge(animal: controller.animal.value!),
          SizedBox(height: 14.h),

          // نوع السجل (فحص / علاج / تطعيم)
          AppField(
            label: 'نوع السجل',
            child: Obx(() => Row(
                  children: [
                    _typeBtn(MedType.checkup, 'فحص', Icons.monitor_heart_outlined),
                    SizedBox(width: 8.w),
                    _typeBtn(MedType.treatment, 'علاج', Icons.medical_services_outlined),
                    SizedBox(width: 8.w),
                    _typeBtn(MedType.vaccine, 'تطعيم', Icons.shield_outlined),
                  ],
                )),
          ),
          SizedBox(height: 14.h),

          // القائمة الذكية (تتغيّر خياراتها حسب النوع) + "+ إضافة جديد"
          Obx(() => CustomSelect(
                key: ValueKey(controller.medType.value), // يُعاد بناؤه عند تغيير النوع
                label: controller.fieldLabel,
                value: controller.selectedName.value,
                options: controller.currentOptions,
                onChanged: (v) => controller.selectedName.value = v,
                onAddCustom: controller.addCustom,
              )),

          // تحذير التطعيم المكرر
          Obx(() {
            final w = controller.vaccineWarning;
            if (w == null) return const SizedBox.shrink();
            return Container(
              margin: EdgeInsets.only(top: 12.h),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.yellowBg,
                border: Border.all(color: const Color(0xFFFDE68A)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(children: [
                Icon(Icons.warning_amber_rounded,
                    color: AppColors.yellowFg, size: 18.sp),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(w,
                      style: TextStyle(
                          color: AppColors.yellowFg,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600)),
                ),
              ]),
            );
          }),
          SizedBox(height: 14.h),

          // ملاحظات
          AppField(
            label: 'ملاحظات (اختياري)',
            child: TextField(
              maxLines: 3,
              onChanged: (v) => controller.notes.value = v,
              decoration: appInputDecoration('ملاحظات إضافية...'),
            ),
          ),
          SizedBox(height: 20.h),

          Obx(() => _primaryButton(
                label: '✓  حفظ السجل',
                enabled: controller.canSave,
                onTap: controller.save,
              )),
        ],
      ),
    );
  }

  Widget _typeBtn(MedType t, String label, IconData icon) {
    final active = controller.medType.value == t;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.setType(t),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: active ? AppColors.primaryDark : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: active ? AppColors.primaryDark : AppColors.border,
                width: 1.5),
          ),
          child: Column(
            children: [
              Icon(icon,
                  size: 18.sp, color: active ? Colors.white : AppColors.textMuted),
              SizedBox(height: 4.h),
              Text(label,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: active ? Colors.white : AppColors.textMuted)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _primaryButton({
    required String label,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDark,
          disabledBackgroundColor: const Color(0xFF9DE0C6),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 0,
        ),
        child: Text(label,
            style: TextStyle(
                color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
