import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/animal_badge.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/app_field.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/widgets/saved_overlay.dart';
import 'package:insighta/widgets/scan_id_input.dart';
import 'package:insighta/models/weight_record.dart';
import '../controllers/weight_op_controller.dart';

class WeightOpView extends GetView<WeightOpController> {
  const WeightOpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Column(
        children: [
          const BackHeader(title: 'تسجيل وزن'),
          Expanded(
            child: Obx(() {
              switch (controller.step.value) {
                case WeightStep.scanId:
                  return _scanStep();
                case WeightStep.form:
                  return _formStep();
                case WeightStep.saved:
                  return const SavedOverlay(message: 'تم تسجيل الوزن بنجاح');
              }
            }),
          ),
        ],
      ),
    );
  }

  // ── الخطوة 1: إدخال/مسح الـ ID ──
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

  // ── الخطوة 2: الفورم (البادج + آخر الأوزان + الوزن الجديد) ──
  Widget _formStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimalBadge(animal: controller.animal.value!),
          SizedBox(height: 14.h),
          _lastWeightsCard(),
          SizedBox(height: 16.h),
          AppField(
            label: 'الوزن الجديد (كغ)',
            child: TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (v) => controller.weightValue.value = v,
              decoration: appInputDecoration('مثال: 47.5').copyWith(
                suffixText: 'كغ',
                suffixStyle: TextStyle(color: AppColors.textMuted, fontSize: 12.sp),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Obx(() => _primaryButton(
                label: '✓  حفظ الوزن',
                enabled: controller.canSave,
                onTap: controller.save,
              )),
        ],
      ),
    );
  }

  Widget _lastWeightsCard() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text('آخر ${controller.lastWeights.length} أوزان',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMuted)),
          ),
          if (controller.lastWeights.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text('لا توجد سجلات وزن سابقة',
                  style: TextStyle(fontSize: 12.sp, color: AppColors.textMuted)),
            )
          else
            ...controller.lastWeights.map(_weightRow),
        ],
      ),
    );
  }

  Widget _weightRow(WeightRecord w) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        children: [
          Text('${w.weight.toStringAsFixed(0)} كغ',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900)),
          const Spacer(),
          Text(AppDate.formatDate(w.date),
              style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted)),
          SizedBox(width: 8.w),
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
                color: w.synced ? AppColors.primary : AppColors.amber,
                shape: BoxShape.circle),
          ),
        ],
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
          disabledBackgroundColor: const Color(0xFF9DE0C6), // أخضر فاتح (معطّل)
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
