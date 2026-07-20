import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/app_field.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/widgets/custom_select.dart';
import 'package:insighta/models/midicine.dart';
import 'package:insighta/models/medicine_log.dart';
import '../controllers/medicine_detail_controller.dart';

class MedicineDetailView extends GetView<MedicineDetailController> {
  const MedicineDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Obx(() {
        final m = controller.medicine.value;
        if (controller.isLoading.value && m == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (m == null) {
          return Column(children: [
            const BackHeader(title: 'تفاصيل الدواء'),
            SizedBox(height: 40.h),
            Center(child: Text('غير موجود', style: TextStyle(fontSize: 14.sp))),
          ]);
        }
        return Column(
          children: [
            BackHeader(title: m.name, subtitle: 'تفاصيل الدواء'),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _stockCard(m),
                    SizedBox(height: 14.h),
                    if (controller.isExpired)
                      _expiredNote()
                    else ...[
                      _adjustForm(context),
                      SizedBox(height: 14.h),
                      _batchesCard(),
                    ],
                    SizedBox(height: 14.h),
                    _logCard(),
                    SizedBox(height: 14.h),
                    _deleteBtn(),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _stockCard(Medicine m) {
    final expired = controller.isExpired;
    final soon = !expired && AppDate.isExpiringSoon(controller.effectiveExpiry);
    final badge = expired
        ? ['منتهي', AppColors.redBg, AppColors.redFg]
        : soon
            ? ['ينتهي قريباً', AppColors.yellowBg, AppColors.yellowFg]
            : ['صالح', AppColors.emeraldBg, AppColors.emeraldFg];
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 20)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                    color: badge[1] as Color, borderRadius: BorderRadius.circular(20)),
                child: Text(badge[0] as String,
                    style: TextStyle(
                        fontSize: 11.sp, fontWeight: FontWeight.bold, color: badge[2] as Color)),
              ),
              SizedBox(height: 6.h),
              Text('ينتهي ${AppDate.formatDate(controller.effectiveExpiry)}',
                  style: TextStyle(fontSize: 11.sp, color: AppColors.amber)),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('الكمية الحالية',
                  style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted)),
              Text('${m.quantity}',
                  style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w900, height: 1)),
              Text(m.unit, style: TextStyle(fontSize: 12.sp, color: AppColors.textMuted)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _expiredNote() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.redBg,
        border: Border.all(color: const Color(0xFFFCA5A5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Icon(Icons.warning_amber_rounded, color: AppColors.destructive, size: 18.sp),
        SizedBox(width: 8.w),
        Expanded(
          child: Text('هذا الدواء منتهي الصلاحية — يمكنك حذفه فقط',
              style: TextStyle(
                  color: AppColors.redFg, fontSize: 12.sp, fontWeight: FontWeight.w600)),
        ),
      ]),
    );
  }

  Widget _adjustForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text('تعديل الكمية',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10.h),
          AppField(
            label: 'الكمية',
            child: TextField(
              controller: controller.qtyCtrl,
              keyboardType: TextInputType.number,
              decoration: appInputDecoration('مثال: 5'),
            ),
          ),
          SizedBox(height: 10.h),
          Obx(() => CustomSelect(
                label: 'ملاحظة / سبب الحركة',
                value: controller.note.value,
                options: controller.catalog.medicineReasons,
                onChanged: (v) => controller.note.value = v,
                onAddCustom: controller.catalog.addMedicineReason,
              )),
          SizedBox(height: 10.h),
          AppField(
            label: 'سعر الشراء للوحدة (ريال - اختياري)',
            child: TextField(
              controller: controller.priceCtrl,
              keyboardType: TextInputType.number,
              decoration: appInputDecoration('مثال: 85'),
            ),
          ),
          SizedBox(height: 10.h),
          _dateField(context, 'تاريخ انتهاء صلاحية الدفعة (اختياري)', controller.batchExpiry),
          SizedBox(height: 10.h),
          Obx(() => CustomSelect(
                label: 'المورد (اختياري)',
                value: controller.selectedVendor.value,
                options: controller.vendors.map((v) => v.name).toList(),
                onChanged: (v) => controller.selectedVendor.value = v,
              )),
          SizedBox(height: 14.h),
          Row(children: [
            Expanded(
              child: Obx(() => _btn('+  إضافة', AppColors.primaryDark,
                  controller.canAdjust, controller.addQuantity)),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Obx(() => _btn('-  سحب', AppColors.destructive,
                  controller.canAdjust, controller.removeQuantity)),
            ),
          ]),
        ],
      ),
    );
  }

  // بطاقة الدُفعات (تصوّر منطق FEFO)
  Widget _batchesCard() {
    final batches = controller.batches;
    if (batches.length <= 1) return const SizedBox.shrink();
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text('الدُفعات النشِطة (الأقرب انتهاءً يُستهلك أولاً)',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
          ),
          ...batches.asMap().entries.map((e) {
            final b = e.value;
            final expired = AppDate.isExpired(b.expiry);
            final soon = !expired && AppDate.isExpiringSoon(b.expiry);
            final c = expired
                ? AppColors.redFg
                : soon
                    ? AppColors.yellowFg
                    : AppColors.emeraldFg;
            return Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(children: [
                Container(width: 8.w, height: 8.w, decoration: BoxDecoration(color: c, shape: BoxShape.circle)),
                SizedBox(width: 8.w),
                Text('دُفعة ${e.key + 1}', style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted)),
                const Spacer(),
                Text('تنتهي ${AppDate.formatDate(b.expiry)}',
                    style: TextStyle(fontSize: 11.sp, color: c)),
                SizedBox(width: 10.w),
                Text('${b.quantity}',
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w900)),
              ]),
            );
          }),
        ],
      ),
    );
  }

  Widget _logCard() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text('سجل الكميات · ${controller.logs.length} عملية',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.textMuted)),
          ),
          if (controller.logs.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text('لا توجد حركات', style: TextStyle(fontSize: 12.sp, color: AppColors.textMuted)),
            )
          else
            ...controller.logs.map(_logRow),
        ],
      ),
    );
  }

  Widget _logRow(MedicineLog l) {
    final isAdd = l.type == MedicineLogType.add;
    final color = isAdd ? AppColors.emeraldFg : AppColors.redFg;
    final vendor = controller.vendorName(l.vendorId);
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 26.w,
            height: 26.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: isAdd ? AppColors.emeraldBg : AppColors.redBg, shape: BoxShape.circle),
            child: Icon(isAdd ? Icons.add : Icons.remove, size: 15.sp, color: color),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  if (l.purchasePrice != null)
                    Text('${l.purchasePrice!.toStringAsFixed(0)} ر/وحدة · ',
                        style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted)),
                  Text('${isAdd ? "+" : "-"}${l.quantity}',
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w900, color: color)),
                ]),
                Text(
                  [
                    AppDate.formatDate(l.date),
                    l.note,
                    if (l.batchExpiryDate != null) 'صلاحية: ${AppDate.formatDate(l.batchExpiryDate!)}',
                    if (vendor.isNotEmpty) vendor,
                  ].join(' · '),
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 10.sp, color: AppColors.textMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _deleteBtn() {
    return OutlinedButton.icon(
      onPressed: controller.deleteMedicine,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.redBg,
        side: const BorderSide(color: Color(0xFFFCA5A5)),
        padding: EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      icon: Icon(Icons.delete_outline, color: AppColors.redFg, size: 18.sp),
      label: Text('حذف هذا الدواء نهائياً',
          style: TextStyle(color: AppColors.redFg, fontSize: 14.sp, fontWeight: FontWeight.bold)),
    );
  }

  Widget _btn(String label, Color color, bool enabled, VoidCallback onTap) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: enabled ? color : color.withOpacity(0.4),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(label,
            style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold)),
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
                  style: TextStyle(fontSize: 13.sp, color: has ? AppColors.textMain : AppColors.textMuted)),
            ]),
          ),
        );
      }),
    );
  }
}
