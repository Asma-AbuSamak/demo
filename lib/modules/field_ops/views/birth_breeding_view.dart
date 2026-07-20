import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/animal_badge.dart';
import 'package:insighta/widgets/animal_form_fields.dart';
import 'package:insighta/widgets/app_field.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/widgets/gradient_button.dart';
import 'package:insighta/widgets/saved_overlay.dart';
import 'package:insighta/widgets/scan_id_input.dart';
import '../controllers/birth_breeding_controller.dart';

class BirthBreedingView extends GetView<BirthBreedingController> {
  const BirthBreedingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Column(
        children: [
          const BackHeader(title: 'ولادة وتزاوج'),
          Expanded(
            child: Obx(() {
              if (controller.mode.value == null) return _selector();
              if (controller.mode.value == BbMode.birth) return _birth(context);
              return _breeding(context);
            }),
          ),
        ],
      ),
    );
  }

  // ── اختيار النوع ──
  Widget _selector() {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        SizedBox(height: 6.h),
        Center(
          child: Text('اختر نوع العملية التي تريد تسجيلها',
              style: TextStyle(fontSize: 12.sp, color: AppColors.textMuted)),
        ),
        SizedBox(height: 16.h),
        _modeCard(
          title: 'تسجيل ولادة',
          sub: 'إضافة مولود جديد وربطه بأبويه',
          icon: Icons.favorite,
          gradient: const [Color(0xFFA78BFA), Color(0xFF7C3AED)],
          onTap: () => controller.selectMode(BbMode.birth),
        ),
        SizedBox(height: 12.h),
        _modeCard(
          title: 'تسجيل تزاوج',
          sub: 'فحص القرابة وتسجيل التزاوج',
          icon: Icons.favorite_border,
          gradient: const [Color(0xFFF472B6), Color(0xFFDB2777)],
          onTap: () => controller.selectMode(BbMode.breeding),
        ),
      ],
    );
  }

  Widget _modeCard({
    required String title,
    required String sub,
    required IconData icon,
    required List<Color> gradient,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16)],
        ),
        child: Row(children: [
          Icon(Icons.chevron_left, size: 18.sp, color: const Color(0xFFD1D5DB)),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 2.h),
              Text(sub, style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted)),
            ],
          ),
          SizedBox(width: 12.w),
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: gradient),
                borderRadius: BorderRadius.circular(14)),
            child: Icon(icon, color: Colors.white, size: 24.sp),
          ),
        ]),
      ),
    );
  }

  // ── الولادة ──
  Widget _birth(BuildContext context) {
    switch (controller.birthStep.value) {
      case BirthStep.parents:
        return _birthParents();
      case BirthStep.details:
        return _birthDetails(context);
      case BirthStep.saved:
        return const SavedOverlay(message: 'تم تسجيل المولود بنجاح');
    }
  }

  Widget _birthParents() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // الأم (إلزامي)
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F3FF),
              border: Border.all(color: const Color(0xFFDDD6FE)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('♥ بيانات الأم',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF7C3AED))),
                ),
                SizedBox(height: 10.h),
                Obx(() => ScanIdInput(
                      label: 'ID الأم (إلزامي)',
                      controller: controller.motherCtrl,
                      onScan: controller.scanMother,
                      scanning: controller.scanningMother.value,
                    )),
                Obx(() => controller.mother.value != null
                    ? AnimalBadge(animal: controller.mother.value!)
                    : const SizedBox.shrink()),
                Obx(() => controller.autoFatherMsg.value != null
                    ? Container(
                        margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: AppColors.accentLight,
                          border: Border.all(color: const Color(0xFFA7F3D0)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(children: [
                          Icon(Icons.check_circle,
                              color: AppColors.emeraldFg, size: 16.sp),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text('تم التعرف على الأب تلقائياً · ${controller.autoFatherMsg.value}',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: AppColors.emeraldFg,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ]),
                      )
                    : const SizedBox.shrink()),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          // الأب (اختياري)
          Obx(() => ScanIdInput(
                label: controller.autoFatherMsg.value != null
                    ? 'ID الأب (تم الكشف تلقائياً)'
                    : 'ID الأب (اختياري)',
                controller: controller.fatherCtrl,
                onScan: controller.scanFather,
                scanning: controller.scanningFather.value,
              )),
          Obx(() => controller.father.value != null
              ? AnimalBadge(animal: controller.father.value!)
              : const SizedBox.shrink()),
          SizedBox(height: 20.h),
          Obx(() => GradientButton(
                label: 'التالي - بيانات المولود  ←',
                enabled: controller.canNextBirth,
                onTap: controller.nextBirth,
              )),
        ],
      ),
    );
  }

  Widget _birthDetails(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(() => GestureDetector(
                onTap: controller.scanningNewborn.value ? null : controller.scanNewborn,
                child: Container(
                  width: 110.w,
                  height: 110.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.accentLight,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                  child: controller.scanningNewborn.value
                      ? const CircularProgressIndicator()
                      : Column(mainAxisSize: MainAxisSize.min, children: [
                          Icon(Icons.qr_code_scanner, size: 36.sp, color: AppColors.primaryDark),
                          SizedBox(height: 4.h),
                          Text('مسح شريحة المولود',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryDark)),
                        ]),
                ),
              )),
          SizedBox(height: 10.h),
          Center(
            child: Text('أو أدخل الـ ID يدوياً',
                style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted)),
          ),
          SizedBox(height: 12.h),
          AppField(
            label: 'ID الشريحة',
            child: TextField(
              controller: controller.newbornCtrl,
              onChanged: (v) => controller.newbornVal.value = v,
              decoration: appInputDecoration('مثال : RF-011'),
            ),
          ),
          SizedBox(height: 14.h),
          AnimalFormFields(form: controller.birthForm),
          SizedBox(height: 20.h),
          Obx(() => GradientButton(
                label: 'حفظ المولود',
                icon: Icons.check,
                enabled: controller.canSaveBirth,
                onTap: controller.saveBirth,
              )),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  // ── التزاوج ──
  Widget _breeding(BuildContext context) {
    if (controller.breedStep.value == BreedStep.saved) {
      return const SavedOverlay(
          message: 'تم تسجيل التزاوج وتحديث حالة الأنثى');
    }
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF2F8),
              border: Border.all(color: const Color(0xFFFBCFE8)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('تحديد الزوجين',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFDB2777))),
                ),
                SizedBox(height: 10.h),
                Obx(() => ScanIdInput(
                      label: 'ID الأنثى',
                      controller: controller.femaleCtrl,
                      onScan: controller.scanFemale,
                      scanning: controller.scanningFemale.value,
                    )),
                Obx(() => controller.female.value != null
                    ? AnimalBadge(animal: controller.female.value!)
                    : const SizedBox.shrink()),
                SizedBox(height: 10.h),
                Obx(() => ScanIdInput(
                      label: 'ID الذكر',
                      controller: controller.maleCtrl,
                      onScan: controller.scanMale,
                      scanning: controller.scanningMale.value,
                    )),
                Obx(() => controller.male.value != null
                    ? AnimalBadge(animal: controller.male.value!)
                    : const SizedBox.shrink()),
              ],
            ),
          ),
          // تحذير القرابة
          Obx(() {
            final w = controller.kinshipWarning;
            if (w == null) return const SizedBox.shrink();
            return Container(
              margin: EdgeInsets.only(top: 12.h),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.redBg,
                border: Border.all(color: const Color(0xFFFCA5A5)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(children: [
                Icon(Icons.warning_amber_rounded, color: AppColors.destructive, size: 18.sp),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('تحذير - الخرفان أقارب!',
                          style: TextStyle(
                              color: AppColors.redFg,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold)),
                      Text(w,
                          style: TextStyle(color: AppColors.redFg, fontSize: 11.sp)),
                    ],
                  ),
                ),
              ]),
            );
          }),
          SizedBox(height: 14.h),
          Obx(() => _dateField(context, 'تاريخ التزاوج', controller.breedDate)),
          SizedBox(height: 20.h),
          Obx(() {
            final warned = controller.kinshipWarning != null;
            if (warned) {
              // زر كهرماني عند وجود قرابة
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: controller.canSaveBreeding ? controller.saveBreeding : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.amber,
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  icon: Icon(Icons.check, color: Colors.white, size: 18.sp),
                  label: Text('تسجيل رغم التحذير',
                      style: TextStyle(
                          color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold)),
                ),
              );
            }
            return GradientButton(
              label: 'تسجيل التزاوج',
              icon: Icons.check,
              enabled: controller.canSaveBreeding,
              onTap: controller.saveBreeding,
            );
          }),
        ],
      ),
    );
  }

  Widget _dateField(BuildContext context, String label, RxString target) {
    final has = target.value.isNotEmpty;
    return AppField(
      label: label,
      child: GestureDetector(
        onTap: () async {
          final now = DateTime.now();
          final picked = await showDatePicker(
            context: context,
            initialDate: has ? DateTime.parse(target.value) : now,
            firstDate: DateTime(now.year - 5),
            lastDate: DateTime(now.year + 1),
          );
          if (picked != null) target.value = AppDate.addDaysIso(picked, 0);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.pageBg,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(children: [
            Icon(Icons.calendar_today_outlined, size: 16.sp, color: AppColors.textMuted),
            SizedBox(width: 8.w),
            Text(has ? AppDate.formatDate(target.value) : 'mm/dd/yyyy',
                style: TextStyle(fontSize: 13.sp, color: AppColors.textMain)),
          ]),
        ),
      ),
    );
  }
}
