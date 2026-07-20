import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/models/medicine_log.dart';
import '../controllers/inventory_index_controller.dart';

class InventoryIndexView extends GetView<InventoryIndexController> {
  const InventoryIndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
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
                      style: TextStyle(fontSize: 14.sp, color: AppColors.textMuted)),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: controller.addLogs.length,
                itemBuilder: (_, i) => _card(controller.addLogs[i]),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _card(MedicineLog l) {
    final vendor = controller.vendorName(l.vendorId);
    final total = l.purchasePrice != null ? l.purchasePrice! * l.quantity : null;
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: cardDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34.w,
              height: 34.w,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: AppColors.emeraldBg, shape: BoxShape.circle),
              child: Icon(Icons.add, size: 18.sp, color: AppColors.emeraldFg),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppDate.formatDate(l.date),
                          style: TextStyle(fontSize: 10.sp, color: AppColors.textMuted)),
                      Flexible(
                        child: Text(controller.medName(l.medicineId),
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  _line('الكمية', '${l.quantity} ${controller.medUnit(l.medicineId)}'),
                  if (l.purchasePrice != null)
                    _line('السعر',
                        '${l.purchasePrice!.toStringAsFixed(0)} ر/وحدة · الإجمالي: ${total!.toStringAsFixed(0)} ر'),
                  if (vendor.isNotEmpty) _line('المورد', vendor),
                  if (l.note.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Text(l.note,
                          style: TextStyle(fontSize: 11.sp, color: AppColors.primaryDark)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _line(String label, String value) => Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: Text('$label: $value',
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted)),
      );
}
