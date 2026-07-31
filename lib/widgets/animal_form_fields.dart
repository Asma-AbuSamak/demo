import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insighta/app_constants.dart';
import 'package:insighta/models/animal/animal.dart';
import 'package:insighta/styles/theme_x.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/animalformstate.dart';
import 'app_field.dart';
import 'custom_select.dart';
import 'sheep_svg.dart';

/// حقول نموذج الحيوان المشتركة (إضافة/تعديل). كلها reactive عبر Obx.
class AnimalFormFields extends StatelessWidget {
  final AnimalFormState form;
  const AnimalFormFields({super.key, required this.form});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,//لتوسيع الحقول على كامل العرض
      children: [
        AppField(
          label: 'الجنس',
          child: Obx(() => Row(children: [
                _toggle('أنثى', form.gender.value == Gender.female,
                    () => form.gender.value = Gender.female, context,
                    leading: const SheepSVG(size: 18)),
                SizedBox(width: 8.w),
                _toggle('ذكر', form.gender.value == Gender.male,
                    () => form.gender.value = Gender.male, context,
                    leading: const SheepSVG(male: true, size: 18)),
              ])),
        ),
        SizedBox(height: 14.h),

        // السلالة
        Obx(() => CustomSelect(
              label: 'السلالة / النوع',
              value: form.breed.value,
              options: AppConstants.breeds,
              onChanged: (v) => form.breed.value = v,
            )),
        SizedBox(height: 14.h),

        // مصدر الخروف
        AppField(
          label: 'مصدر الخروف',
          child: Obx(() => Row(children: [
                _toggle('مولود', form.origin.value == Origin.born,
                    () => form.origin.value = Origin.born, context,
                    icon: Icons.eco_outlined),
                SizedBox(width: 8.w),
                _toggle('مشترى', form.origin.value == Origin.purchased,
                    () => form.origin.value = Origin.purchased, context,
                    icon: Icons.shopping_bag_outlined),
              ])),
        ),
        SizedBox(height: 14.h),

        // القسم المتغيّر حسب المصدر
        Obx(() => form.origin.value == Origin.born
            ? _bornBox(context)
            : _purchasedBox(context)),
        SizedBox(height: 14.h),

        // تاريخ الميلاد (اختياري للمشترى)
        Obx(() => _dateField(
              context,
              form.origin.value == Origin.purchased
                  ? 'تاريخ الميلاد (اختياري)'
                  : 'تاريخ الميلاد',
              form.birthDate,
            )),
        SizedBox(height: 14.h),

        // الوزن
        AppField(
          label: 'الوزن (كغ)',
          child: TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            controller: TextEditingController(text: form.weight.value)
              ..selection = TextSelection.collapsed(offset: form.weight.value.length),
            onChanged: (v) => form.weight.value = v,
            decoration: appInputDecoration(context, 'كغ'),
          ),
        ),
        SizedBox(height: 14.h),

        // الحالة الصحية
        AppField(
          label: 'الحالة الصحية',
          child: Obx(() => Row(children: [
                _statusBtn('بصحة جيدة', AnimalStatus.healthy, context),
                SizedBox(width: 8.w),
                _statusBtn('مريض', AnimalStatus.sick, context),
                SizedBox(width: 8.w),
                _statusBtn('حامل', AnimalStatus.pregnant, context),
              ])),
        ),
        SizedBox(height: 14.h),

        // ملاحظات
        AppField(
          label: 'ملاحظات',
          child: TextField(
            maxLines: 3,
            onChanged: (v) => form.notes.value = v,
            decoration: appInputDecoration(context, 'أي ملاحظات إضافية...'),
          ),
        ),
      ],
    );
  }

  // بيانات الولادة (الأبوان)
  Widget _bornBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: context.palette.accentLight,
        border: Border.all(color: const Color(0xFFA7F3D0)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text('بيانات الولادة',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: context.palette.successFg)),
          ),
          SizedBox(height: 10.h),
          AppField(
            label: 'ID الأم',
            child: _plainField('اختياري', form.motherId, context),
          ),
          SizedBox(height: 10.h),
          AppField(
            label: 'ID الأب',
            child: _plainField('اختياري', form.fatherId, context),
          ),
        ],
      ),
    );
  }

  // بيانات الشراء + العمر
  Widget _purchasedBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: context.palette.infoBg.withOpacity(0.4),
        border: Border.all(color: const Color(0xFFBFDBFE)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text('بيانات الشراء',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: context.palette.infoFg)),
          ),
          SizedBox(height: 10.h),
          AppField(label: 'اسم المورد', child: _plainField('مثال: سوق الماشية', form.vendorName, context)),
          SizedBox(height: 10.h),
          _dateField(context, 'تاريخ الشراء', form.purchaseDate),
          SizedBox(height: 10.h),
          AppField(
            label: 'السعر (ريال)',
            child: _plainField('مثال: 2800', form.purchasePrice, context,
                number: true),
          ),
          SizedBox(height: 10.h),
          // ★ العمر (المطلوب للمشترى) — يُستخدم لاشتقاق تاريخ الميلاد إن تُرك فارغاً
          AppField(
            label: 'العمر التقريبي',
            child: Row(children: [
              Expanded(child: _plainField('سنوات', form.ageYears, context, number: true)),
              SizedBox(width: 8.w),
              Expanded(child: _plainField('أشهر', form.ageMonths, context, number: true)),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _plainField(String hint, RxString target, BuildContext context, {bool number = false}) {
    return TextField(
      keyboardType: number ? TextInputType.number : TextInputType.text,
      controller: TextEditingController(text: target.value)
        ..selection = TextSelection.collapsed(offset: target.value.length),
      onChanged: (v) => target.value = v,
      decoration: appInputDecoration(context, hint),
    );
  }

  Widget _dateField(BuildContext context, String label, Rxn<int> target) {
    final has = target.value != null;
    return AppField(
      label: label,
      child: GestureDetector(
        onTap: () async {
          final now = DateTime.now();
          final picked = await showDatePicker(//** */
            context: context,
            initialDate: has ? DateTime.fromMillisecondsSinceEpoch(target.value!, isUtc: true) : now,
            firstDate: DateTime(now.year - 20),
            lastDate: now,//ما بقدر اختار من المستقبل
          );
          if (picked != null) target.value = AppDate.dateOnlyEpoch(picked);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: context.palette.pageBg,
            border: Border.all(color: context.palette.border),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(children: [
            Icon(Icons.calendar_today_outlined, size: 16.sp, color: context.palette.textMuted),
            SizedBox(width: 8.w),
            Text(has ? AppDate.formatEpoch(target.value!) : 'mm/dd/yyyy',
                style: TextStyle(
                    fontSize: 13.sp,
                    color: has ? context.palette.textMain : context.palette.textMuted)),
          ]),
        ),
      ),
    );
  }

  Widget _toggle(String label, bool active, VoidCallback onTap, BuildContext context,
      {IconData? icon, Widget? leading}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 11.h),
          decoration: BoxDecoration(
            color: active ? context.palette.primaryStrong : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: active ? context.palette.primaryStrong : context.palette.border, width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leading != null) ...[leading, SizedBox(width: 6.w)],
              if (icon != null) ...[
                Icon(icon, size: 16.sp, color: active ? Colors.white : context.palette.textMuted),
                SizedBox(width: 6.w),
              ],
              Text(label,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: active ? Colors.white : context.palette.textMuted)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusBtn(String label, AnimalStatus s, BuildContext context) {
    final active = form.status.value == s;
    return Expanded(
      child: GestureDetector(
        onTap: () => form.status.value = s,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? context.palette.primaryStrong : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: active ? context.palette.primaryStrong : context.palette.border, width: 1.5),
          ),
          child: Text(label,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: active ? Colors.white : context.palette.textMuted)),
        ),
      ),
    );
  }
}