import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/app_routes.dart';
import 'package:insighta/styles/theme_x.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/models/medicine/medicine.dart';
import 'package:insighta/models/vendor/vendor.dart';
import '../controllers/inventory_controller.dart';

class InventoryView extends GetView<InventoryController> {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: EdgeInsets.all(16.w),
            children: [
              _tabsRow(context),
              SizedBox(height: 16.h),
              if (controller.tab.value == 0) ..._medicinesSection(context) else ..._vendorsSection(context),
              SizedBox(height: 90.h),
            ],
          );
        }),
        Positioned(
          left: 16.w,
          bottom: 16.h,
          // FAB ثابت بصرياً — الإجراء يقرأ tab.value وقت الضغط (بلا Obx).
          child: GestureDetector(
            onTap: () => controller.tab.value == 1
                ? Get.toNamed(Routes.vendorDetail)
                : Get.toNamed(Routes.medicineAdd),
            child: Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                  gradient: context.palette.headerGradient, shape: BoxShape.circle),
              child: Icon(Icons.add, color: Colors.white, size: 28.sp),
            ),
          ),
        ),
      ],
    );
  }

  Widget _tabsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
                color: context.palette.border,
                borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              Expanded(child: _tab('🧪 الأدوية', 0, context)),
              Expanded(child: _tab('📋 الموردون', 1, context)),
            ]),
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.inventoryIndex),
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: cardDecoration(context, radius: BorderRadius.circular(12)),
            child: Icon(Icons.receipt_long_outlined,
                size: 18.sp, color: context.palette.textMuted),
          ),
        ),
      ],
    );
  }

  Widget _tab(String label, int i, BuildContext context) {
    final active = controller.tab.value == i;
    return GestureDetector(
      onTap: () => controller.tab.value = i,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: active
              ? [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6)]
              : null,
        ),
        child: Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: active ? context.palette.successFg : context.palette.textMuted)),
      ),
    );
  }

  List<Widget> _medicinesSection(BuildContext context) {
    return [
      if (controller.expiredCount > 0 || controller.soonCount > 0)
        Container(
          margin: EdgeInsets.only(bottom: 8.h),
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: context.palette.dangerBg,
            border: Border.all(color: const Color(0xFFFCA5A5)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(children: [
            Icon(Icons.warning_amber_rounded,
                color: context.colors.error, size: 18.sp),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                controller.soonCount > 0
                    ? '${controller.expiredCount} منتهي الصلاحية · ${controller.soonCount} ينتهي قريباً'
                    : '${controller.expiredCount} منتهي الصلاحية',
                style: TextStyle(
                    color: context.palette.dangerFg,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ]),
        ),
      ...controller.medicines.map((m) => _medicineCard(m, context)),
    ];
  }

  Widget _medicineCard(Medicine m, BuildContext context) {
    final expired = controller.isExpired(m);
    final soon = controller.isSoon(m);
    final accent = expired
        ? const Color(0xFFF87171)
        : soon
            ? const Color(0xFFFACC15)
            : null;

    Widget badge;
    if (expired) {
      badge = _pill('منتهي', context.palette.dangerBg, context.palette.dangerFg);
    } else if (soon) {
      badge = _pill('ينتهي قريباً', context.palette.warningBg, context.palette.warningFg);
    } else {
      badge = _pill('صالح', context.palette.successBg, context.palette.successFg);
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.medicineDetail, arguments: m.id),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: cardDecoration(context).copyWith(
            border: accent != null
                ? Border(right: BorderSide(color: accent, width: 4))
                : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(m.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: expired ? context.palette.dangerFg : context.palette.textMain)),
                    SizedBox(height: 2.h),
                    Row(children: [
                      Text('الكمية: ${m.quantity} ${m.unit}',
                          style: TextStyle(
                              fontSize: 11.sp, color: context.palette.textMuted)),
                      if (m.quantity == 0)
                        Text(' · نفد المخزون',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                color: context.palette.dangerFg)),
                    ]),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              badge,
              SizedBox(width: 4.w),
              Icon(Icons.chevron_left, size: 18.sp, color: const Color(0xFFD1D5DB)),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _vendorsSection(BuildContext context) {
    return controller.vendors.map((v) => _vendorCard(v, context)).toList();
  }

  Widget _vendorCard(Vendor v, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.vendorDetail, arguments: v.id),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: cardDecoration(context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(v.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 15.sp)),
                    SizedBox(height: 2.h),
                    Text(v.specialty,
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: context.palette.primaryStrong)),
                    SizedBox(height: 10.h),
                    _iconLine(Icons.phone, v.phone, context),
                    SizedBox(height: 6.h),
                    _iconLine(Icons.location_on_outlined, v.address, context),
                  ],
                ),
              ),
              Icon(Icons.chevron_left, size: 18.sp, color: const Color(0xFFD1D5DB)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconLine(IconData icon, String text, BuildContext context) => Row(
        children: [
          Icon(icon, size: 14.sp, color: context.palette.primaryStrong),
          SizedBox(width: 6.w),
          Expanded(
            child: Text(text,
                style: TextStyle(fontSize: 13.sp, color: const Color(0xFF374151))),
          ),
        ],
      );

  Widget _pill(String text, Color bg, Color fg) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
        child: Text(text,
            style: TextStyle(
                fontSize: 10.sp, fontWeight: FontWeight.bold, color: fg)),
      );
}
