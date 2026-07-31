import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/theme_x.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/models/medicine_log/medicine_log.dart';
import '../controllers/inventory_index_controller.dart';

class InventoryIndexView extends GetView<InventoryIndexController> {
  const InventoryIndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.pageBg,
      body: Column(
        children: [
          const BackHeader(title: 'السجل', subtitle: 'جميع عمليات الإضافة للمخزن'),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.addLogs.isEmpty) {
                return Center(
                  child: Text('لا توجد عمليات إضافة',
                      style: TextStyle(fontSize: 14.sp, color: context.palette.textMuted)),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: controller.addLogs.length,
                itemBuilder: (_, i) => _card(controller.addLogs[i], context),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _card(MedicineLog l, BuildContext context) {
    final vendor = controller.vendorName(l.vendorId);
    final totalMinor = l.purchasePriceMinor != null ? l.purchasePriceMinor! * l.quantity : null;
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: cardDecoration(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34.w,
              height: 34.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: context.palette.successBg, shape: BoxShape.circle),
              child: Icon(Icons.add, size: 18.sp, color: context.palette.successFg),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppDate.formatEpoch(l.dateUtc),
                          style: TextStyle(fontSize: 10.sp, color: context.palette.textMuted)),
                      Flexible(
                        child: Text(controller.medName(l.medicineId),
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  _line('الكمية', '${l.quantity} ${controller.medUnit(l.medicineId)}', context),
                  if (l.purchasePriceMinor != null)
                    _line('السعر',
                        '${(l.purchasePriceMinor! / 100).toStringAsFixed(0)} ر/وحدة · الإجمالي: ${(totalMinor! / 100).toStringAsFixed(0)} ر', context),
                  if (vendor.isNotEmpty) _line('المورد', vendor, context),
                  if (l.note.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Text(l.note,
                          style: TextStyle(fontSize: 11.sp, color: context.palette.primaryStrong)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _line(String label, String value, BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: Text('$label: $value',
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 11.sp, color: context.palette.textMuted)),
      );
}
