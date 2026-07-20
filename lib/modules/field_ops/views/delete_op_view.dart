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
import '../controllers/delete_op_controller.dart';

class DeleteOpView extends GetView<DeleteOpController> {
  const DeleteOpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Column(
        children: [
          const BackHeader(title: 'ازالة'),
          Expanded(
            child: Obx(() {
              switch (controller.step.value) {
                case DeleteStep.scanId:
                  return _scanStep();
                case DeleteStep.form:
                  return _formStep();
                case DeleteStep.saved:
                  return SavedOverlay(message: controller.savedMsg.value);
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
          Obx(() => _button(
                label: 'بحث',
                color: AppColors.destructive,
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

          // سبب الحذف: وفاة / بيع
          AppField(
            label: 'سبب الحذف',
            child: Obx(() => Row(children: [
                  _reasonBtn(DeleteReason.death, 'وفاة'),
                  SizedBox(width: 8.w),
                  _reasonBtn(DeleteReason.sale, 'بيع'),
                ])),
          ),
          SizedBox(height: 14.h),

          // تفاصيل حسب السبب
          Obx(() => controller.reason.value == DeleteReason.death
              ? CustomSelect(
                  label: 'سبب الوفاة',
                  value: controller.deathCause.value,
                  options: controller.deathCauseOptions,
                  onChanged: (v) => controller.deathCause.value = v,
                  onAddCustom: controller.addDeathCause,
                )
              : AppField(
                  label: 'سعر البيع (ريال)',
                  child: TextField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (v) => controller.salePrice.value = v,
                    decoration: appInputDecoration('مثال: 1800').copyWith(
                      suffixText: 'ر',
                      suffixStyle:
                          TextStyle(color: AppColors.textMuted, fontSize: 12.sp),
                    ),
                  ),
                )),
          SizedBox(height: 14.h),

          AppField(
            label: 'ملاحظات (اختياري)',
            child: TextField(
              maxLines: 3,
              onChanged: (v) => controller.notes.value = v,
              decoration: appInputDecoration('أي تفاصيل إضافية...'),
            ),
          ),
          SizedBox(height: 14.h),

          // تحذير الحذف النهائي
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.redBg,
              border: Border.all(color: const Color(0xFFFCA5A5)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(children: [
              Icon(Icons.warning_amber_rounded,
                  color: AppColors.destructive, size: 18.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: Text('سيتم إزالة الخروف من قائمة الحلال نهائياً',
                    style: TextStyle(
                        color: AppColors.redFg,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600)),
              ),
            ]),
          ),
          SizedBox(height: 16.h),

          _button(
            label: '🗑  تأكيد الحذف',
            color: AppColors.destructive,
            enabled: true,
            onTap: controller.confirm,
          ),
        ],
      ),
    );
  }

  Widget _reasonBtn(DeleteReason r, String label) {
    final active = controller.reason.value == r;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.setReason(r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? AppColors.destructive : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: active ? AppColors.destructive : AppColors.border,
                width: 1.5),
          ),
          child: Text(label,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: active ? Colors.white : AppColors.textMuted)),
        ),
      ),
    );
  }

  Widget _button({
    required String label,
    required Color color,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          disabledBackgroundColor: const Color(0xFFF3A6A6),
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
