import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/widgets/animal_badge.dart';
import 'package:insighta/widgets/animal_form_fields.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/widgets/gradient_button.dart';
import 'package:insighta/widgets/saved_overlay.dart';
import 'package:insighta/widgets/scan_id_input.dart';
import '../controllers/edit_op_controller.dart';

class EditOpView extends GetView<EditOpController> {
  const EditOpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Column(
        children: [
          const BackHeader(title: 'تعديل بيانات'),
          Expanded(
            child: Obx(() {
              switch (controller.step.value) {
                case EditStep.scanId:
                  return _scanStep();
                case EditStep.form:
                  return _formStep(context);
                case EditStep.saved:
                  return const SavedOverlay(message: 'تم تحديث بيانات الخروف بنجاح');
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
      child: Column(children: [
        Obx(() => ScanIdInput(
              label: 'ID الخروف المراد تعديله',
              controller: controller.idCtrl,
              onScan: controller.scan,
              scanning: controller.scanning.value,
            )),
        SizedBox(height: 16.h),
        Obx(() => GradientButton(
              label: 'بحث وتعديل',
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
      ]),
    );
  }

  Widget _formStep(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimalBadge(animal: controller.animal.value!),
          SizedBox(height: 14.h),
          AnimalFormFields(form: controller.form),
          SizedBox(height: 20.h),
          GradientButton(
            label: 'حفظ التعديلات',
            icon: Icons.check,
            onTap: controller.save,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
