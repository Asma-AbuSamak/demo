import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/app_constants.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/app_field.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/widgets/custom_select.dart';
import 'package:insighta/widgets/gradient_button.dart';
import '../controllers/medicine_form_controller.dart';

class MedicineFormView extends GetView<MedicineFormController> {
  const MedicineFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Column(
        children: [
          const BackHeader(title: 'إضافة دواء جديد', subtitle: 'المخزن الطبي'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppField(
                    label: 'اسم الدواء',
                    child: TextField(
                      controller: controller.nameCtrl,
                      decoration: appInputDecoration('مثال: أوكسي تتراسيكلين 20%'),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Row(children: [
                    Expanded(
                      child: AppField(
                        label: 'الكمية',
                        child: TextField(
                          controller: controller.qtyCtrl,
                          keyboardType: TextInputType.number,
                          decoration: appInputDecoration('12'),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Obx(() => CustomSelect(
                            label: 'الوحدة',
                            value: controller.unit.value,
                            options: AppConstants.units,
                            onChanged: (v) => controller.unit.value = v,
                          )),
                    ),
                  ]),
                  SizedBox(height: 14.h),
                  _dateField(context, 'تاريخ انتهاء الصلاحية', controller.expiry),
                  SizedBox(height: 20.h),
                  Obx(() => GradientButton(
                        label: 'حفظ الدواء',
                        icon: Icons.check,
                        enabled: controller.canSave,
                        onTap: controller.save,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateField(BuildContext context, String label, RxString target) {
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
              firstDate: now,
              lastDate: DateTime(now.year + 10),
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
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: has ? AppColors.textMain : AppColors.textMuted)),
            ]),
          ),
        );
      }),
    );
  }
}
