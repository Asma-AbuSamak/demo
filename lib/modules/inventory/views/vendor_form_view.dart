import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/widgets/app_field.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/widgets/gradient_button.dart';
import '../controllers/vendor_form_controller.dart';

class VendorFormView extends GetView<VendorFormController> {
  const VendorFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final edit = controller.isEdit;
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Column(
        children: [
          BackHeader(
            title: edit ? controller.nameCtrl.text : 'إضافة مورد جديد',
            subtitle: edit ? 'تفاصيل المورد' : 'الموردين',
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _field('اسم المورد', 'مثال: صيدلية بيطرية الرياض', controller.nameCtrl),
                  SizedBox(height: 14.h),
                  _field('التخصص', 'مثال: أدوية وتطعيمات', controller.specialtyCtrl),
                  SizedBox(height: 14.h),
                  _field('رقم الجوال', '+966 50 000 0000', controller.phoneCtrl,
                      number: true),
                  SizedBox(height: 14.h),
                  _field('العنوان', 'مثال: الرياض، حي العليا', controller.addressCtrl),
                  SizedBox(height: 20.h),
                  Obx(() => GradientButton(
                        label: edit ? 'حفظ التغييرات' : 'حفظ المورد',
                        icon: Icons.check,
                        enabled: controller.canSave,
                        onTap: controller.save,
                      )),
                  if (edit) ...[
                    SizedBox(height: 14.h),
                    OutlinedButton.icon(
                      onPressed: controller.delete,
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.redBg,
                        side: const BorderSide(color: Color(0xFFFCA5A5)),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      icon: Icon(Icons.delete_outline, color: AppColors.redFg, size: 18.sp),
                      label: Text('حذف هذا المورد نهائياً',
                          style: TextStyle(
                              color: AppColors.redFg,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _field(String label, String hint, TextEditingController ctrl,
      {bool number = false}) {
    return AppField(
      label: label,
      child: TextField(
        controller: ctrl,
        keyboardType: number ? TextInputType.phone : TextInputType.text,
        decoration: appInputDecoration(hint),
      ),
    );
  }
}
