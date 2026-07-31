import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/theme_x.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/back_header.dart';
import '../controllers/deleted_stats_controller.dart';

class DeletedStatsView extends GetView<DeletedStatsController> {
  const DeletedStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.pageBg,
      body: Column(
        children: [
          Obx(() => BackHeader(
                title: 'إحصائيات الوفيات',
                subtitle: '${controller.total.value} حالة وفاة إجمالاً',
              )),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.years.isEmpty) {
                return Center(
                  child: Text('لا توجد وفيات مسجّلة',
                      style: TextStyle(fontSize: 14.sp, color: context.palette.textMuted)),
                );
              }
              return ListView(
                padding: EdgeInsets.all(16.w),
                children: controller.years.map((y) => _yearCard(y, context)).toList(),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _yearCard(DeathYear y, BuildContext context) {
    final open = controller.expanded.contains(y.year);
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: cardDecoration(context),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => controller.toggle(y.year),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(children: [
                Icon(open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: context.palette.textMuted),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('سنة ${y.year}',
                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
                    Text('${y.total} حالة وفاة',
                        style: TextStyle(fontSize: 11.sp, color: context.palette.textMuted)),
                  ],
                ),
                SizedBox(width: 12.w),
                Container(
                  width: 30.w,
                  height: 30.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: context.palette.dangerBg, shape: BoxShape.circle),
                  child: Text('${y.total}',
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w900, color: context.palette.dangerFg)),
                ),
              ]),
            ),
          ),
          if (open)
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
              child: Column(children: y.months.map((m) => _monthBlock(m, context)).toList()),
            ),
        ],
      ),
    );
  }

  Widget _monthBlock(DeathMonth m, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
          color: context.palette.pageBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text('${AppDate.formatMonth(m.key)} - ${m.total} حالة',
                style: TextStyle(
                    fontSize: 12.sp, fontWeight: FontWeight.bold, color: context.palette.textMain)),
          ),
          SizedBox(height: 8.h),
          ...m.causes.map((c) => Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: Row(children: [
                  Text('${c.value} رأس',
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold, color: context.palette.dangerFg)),
                  const Spacer(),
                  Text(c.key, style: TextStyle(fontSize: 12.sp, color: context.palette.textMuted)),
                ]),
              )),
        ],
      ),
    );
  }
}
