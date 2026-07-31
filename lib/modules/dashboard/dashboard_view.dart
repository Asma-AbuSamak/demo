import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insighta/app_routes.dart';
import 'package:insighta/models/animal/animal.dart';
import 'package:insighta/styles/theme_x.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/sheep_svg.dart';

import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          _hero(context),
          SizedBox(height: 12.h),
          Row(children: [
            Expanded(child: _sickCard(context)),
            SizedBox(width: 12.w),
            Expanded(child: _pregnantCard(context)),
          ]),
          SizedBox(height: 12.h),
          Row(children: [
            Expanded(child: _deathsCard(context)),
            SizedBox(width: 12.w),
            Expanded(child: _tradingCard(context)),
          ]),
          SizedBox(height: 12.h),
          _vaccines(context),
          SizedBox(height: 80.h),
        ],
      );
    });
  }

  // البطاقة الكبيرة: الإجمالي + إناث/ذكور
  Widget _hero(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: cardDecoration(context),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('إجمالي الحلال',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: context.palette.textMuted,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 4.h),
                    Text('${controller.total}',
                        style: TextStyle(
                            fontSize: 56.sp,
                            fontWeight: FontWeight.w900,
                            height: 1,
                            color: context.palette.textMain)),
                    SizedBox(height: 4.h),
                    Text('رأس في المزرعة',
                        style: TextStyle(
                            fontSize: 13.sp, color: context.palette.textMuted)),
                  ],
                ),
              ),
              Opacity(opacity: 0.25, child: const SheepSVG(size: 64)),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Divider(color: context.palette.border, height: 1),
          ),
          SizedBox(height: 12.h),
          Row(children: [
            Expanded(child: _genderCol(controller.females, 'إناث', false, context)),
            Container(width: 1, height: 36.h, color: context.palette.border),
            Expanded(child: _genderCol(controller.males, 'ذكور', true, context)),
          ]),
        ],
      ),
    );
  }

  Widget _genderCol(int value, String label, bool male, BuildContext context) {
    return Column(
      children: [
        Text('$value',
            style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w900,
                color: context.palette.textMain)),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SheepSVG(male: male, size: 14),
            SizedBox(width: 4.w),
            Text(label,
                style: TextStyle(fontSize: 11.sp, color: context.palette.textMuted)),
          ],
        ),
      ],
    );
  }

  Widget _sickCard(BuildContext context) {
    final n = controller.sick.length;
    final active = n > 0;
    return _statCard(
      value: '$n',
      valueColor: active ? context.palette.dangerFg : context.palette.textMuted,
      label: 'مريض',
      accent: active ? context.colors.error : null,
      trailing: active ? _detailsLink('التفاصيل', context.palette.dangerFg) : null,
      onTap: active
          ? () => Get.toNamed(Routes.statusList, arguments: AnimalStatus.sick)
          : null,
      context: context,
    );
  }

  Widget _pregnantCard(BuildContext context) {
    final n = controller.pregnant.length;
    final active = n > 0;
    return _statCard(
      value: '$n',
      valueColor: active ? context.palette.warningFg : context.palette.textMuted,
      label: 'حامل',
      accent: active ? const Color(0xFFEAB308) : null,
      trailing: active ? _detailsLink('التفاصيل', context.palette.warningFg) : null,
      onTap: active
          ? () => Get.toNamed(Routes.statusList, arguments: AnimalStatus.pregnant)
          : null,
      context: context,
    );
  }

  Widget _deathsCard(BuildContext context) {
    return _statCard(
      value: '${controller.deathsCount.value}',
      valueColor: const Color(0xFF374151),
      label: 'وفيات',
      trailing: _detailsLink('الإحصائيات', context.palette.textMuted),
      onTap: () => Get.toNamed(Routes.deletedStats),
      context: context,
    );
  }

  Widget _tradingCard(BuildContext context) {
    return _statCard(
      customValue: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text('${controller.totalPurchased}',
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w900,
                  color: context.palette.primaryStrong)),
          Text(' / ',
              style: TextStyle(fontSize: 13.sp, color: context.palette.textMuted)),
          Text('${controller.totalSold}',
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w900,
                  color: context.palette.infoFg)),
        ],
      ),
      label: 'شراء / بيع',
      trailing: _detailsLink('الأرباح', context.palette.textMuted),
      onTap: () => Get.toNamed(Routes.tradingStats),
      context: context,
    );
  }

  Widget _statCard({
    String? value,
    Widget? customValue,
    Color? valueColor,
    required String label,
    Color? accent,
    Widget? trailing,
    VoidCallback? onTap,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: cardDecoration(context).copyWith(
          border: accent != null
              ? Border(right: BorderSide(color: accent, width: 4))
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customValue ??
                Text(value ?? '',
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w900,
                        color: valueColor ?? context.palette.textMain)),
            SizedBox(height: 4.h),
            Text(label,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: context.palette.textMuted)),
            if (trailing != null) ...[SizedBox(height: 2.h), trailing],
          ],
        ),
      ),
    );
  }

  Widget _detailsLink(String text, Color color) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text,
              style: TextStyle(
                  fontSize: 11.sp, color: color, fontWeight: FontWeight.w500)),
          Icon(Icons.chevron_left, size: 14.sp, color: color),
        ],
      );

  Widget _vaccines(BuildContext context) {
    return Container(
      decoration: cardDecoration(context),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          GestureDetector(
            onTap: controller.toggleVaccine,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                        color: context.palette.infoBg,
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(Icons.shield_outlined,
                        color: context.palette.infoFg, size: 20.sp),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('التطعيمات',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.sp)),
                        Text('${controller.vaccineStats.length} نوع تطعيم مسجّل',
                            style: TextStyle(
                                fontSize: 11.sp, color: context.palette.textMuted)),
                      ],
                    ),
                  ),
                  Icon(
                      controller.vaccineExpanded.value
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: context.palette.textMuted),
                ],
              ),
            ),
          ),
          if (controller.vaccineExpanded.value)
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.w),
              child: Column(
                children: controller.vaccineStats
                    .map((vs) => _vaccineRow(vs, context))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _vaccineRow(VaccineStat vs, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
          color: context.palette.pageBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(vs.name,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 8.h),
          Row(children: [
            Expanded(child: _vaccinePill('${vs.count}', 'أخذه', context.palette.successBg, context.palette.successFg)),
            SizedBox(width: 10.w),
            Expanded(child: _vaccinePill('${vs.notCount}', 'لم يأخذه', context.palette.border, context.palette.textMuted)),
          ]),
        ],
      ),
    );
  }

  Widget _vaccinePill(String value, String label, Color bg, Color fg) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(value,
              style: TextStyle(
                  fontSize: 16.sp, fontWeight: FontWeight.w900, color: fg)),
          Text(label, style: TextStyle(fontSize: 10.sp, color: fg)),
        ],
      ),
    );
  }
}
