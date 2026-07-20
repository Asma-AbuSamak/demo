import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/app_field.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/widgets/custom_select.dart';
import 'package:insighta/models/vaccine_protocol.dart';
import '../controllers/protocols_controller.dart';

class ProtocolAddView extends GetView<ProtocolsController> {
  const ProtocolAddView({super.key});

  ProtocolType get _type => Get.arguments as ProtocolType;

  @override
  Widget build(BuildContext context) {
    final isVaccine = _type == ProtocolType.vaccine;
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Column(
        children: [
          BackHeader(title: isVaccine ? 'إضافة مطعوم جديد' : 'إضافة علاج جديد'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: isVaccine ? _vaccineForm(context) : _treatmentForm(context),
            ),
          ),
        ],
      ),
    );
  }

  // ── نموذج المطعوم ──
  Widget _vaccineForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(() => CustomSelect(
              label: 'اسم المطعوم',
              value: controller.formName.value,
              options: controller.catalog.vaccineNames,
              onChanged: (v) => controller.formName.value = v,
              onAddCustom: controller.catalog.addVaccineName,
            )),
        SizedBox(height: 14.h),
        _dateField(context, 'تاريخ التطعيم', controller.formLastDate,
            onPicked: controller.recomputeVaccineNext),
        SizedBox(height: 14.h),
        Obx(() => CustomSelect(
              label: 'موعد الجرعة التالية',
              value: controller.formSchedule.value,
              options: controller.catalog.schedules.map((s) => s.label).toList(),
              onChanged: (v) {
                controller.formSchedule.value = v;
                controller.recomputeVaccineNext();
              },
              onAddCustom: controller.catalog.addSchedule,
            )),
        SizedBox(height: 14.h),
        _dateField(context, 'تاريخ الجرعة القادمة', controller.formNextDate),
        SizedBox(height: 20.h),
        Obx(() => _saveBtn(
              enabled: controller.canSaveVaccine,
              onTap: () async {
                await controller.saveVaccine();
                Get.back();
              },
            )),
      ],
    );
  }

  // ── نموذج العلاج ──
  Widget _treatmentForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(() => CustomSelect(
              label: 'اسم العلاج',
              value: controller.formName.value,
              options: controller.catalog.treatmentNames,
              onChanged: (v) => controller.formName.value = v,
              onAddCustom: controller.catalog.addTreatmentName,
            )),
        SizedBox(height: 14.h),
        Obx(() => CustomSelect(
              label: 'نوع المرض',
              value: controller.formDisease.value,
              options: controller.catalog.diseaseTypes,
              onChanged: (v) => controller.formDisease.value = v,
              onAddCustom: controller.catalog.addDiseaseType,
            )),
        SizedBox(height: 14.h),
        _dateField(context, 'تاريخ أخذ العلاج', controller.formLastDate,
            onPicked: controller.recomputeTreatmentNext),
        SizedBox(height: 14.h),
        Obx(() => CustomSelect(
              label: 'كل قديش لازم تعطي جرعة',
              value: controller.formInterval.value,
              options: controller.catalog.intervals.map((i) => i.label).toList(),
              onChanged: (v) {
                controller.formInterval.value = v;
                controller.recomputeTreatmentNext();
              },
              onAddCustom: controller.catalog.addInterval,
            )),
        SizedBox(height: 14.h),
        _dateField(context, 'تاريخ الجرعة القادمة', controller.formNextDate),
        SizedBox(height: 20.h),
        Obx(() => _saveBtn(
              enabled: controller.canSaveTreatment,
              onTap: () async {
                await controller.saveTreatment();
                Get.back();
              },
            )),
      ],
    );
  }

  Widget _dateField(BuildContext context, String label, RxString target,
      {VoidCallback? onPicked}) {
    return AppField(
      label: label,
      child: Obx(() {
        final has = target.value.isNotEmpty;
        return GestureDetector(
          onTap: () async {
            final now = DateTime.now();
            final picked = await showDatePicker(
              context: context,
              initialDate: has ? DateTime.parse(target.value) : now,
              firstDate: DateTime(now.year - 5),
              lastDate: DateTime(now.year + 5),
            );
            if (picked != null) {
              target.value = AppDate.addDaysIso(picked, 0); // yyyy-MM-dd
              onPicked?.call();
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: AppColors.pageBg,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today_outlined,
                    size: 16.sp, color: AppColors.textMuted),
                SizedBox(width: 8.w),
                Text(has ? AppDate.formatDate(target.value) : 'mm/dd/yyyy',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: has ? AppColors.textMain : AppColors.textMuted)),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _saveBtn({required bool enabled, required VoidCallback onTap}) {
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
        child: Text('✓  حفظ',
            style: TextStyle(
                color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
