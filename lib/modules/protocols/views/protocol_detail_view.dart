import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/models/vaccine_protocol.dart';
import '../controllers/protocols_controller.dart';

class ProtocolDetailView extends GetView<ProtocolsController> {
  const ProtocolDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments as String;
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Obx(() {
        final p = controller.protocols.firstWhereOrNull((x) => x.id == id);
        if (p == null) {
          return Column(children: [
            const BackHeader(title: 'تفاصيل البروتوكول'),
            SizedBox(height: 40.h),
            Center(child: Text('غير موجود', style: TextStyle(fontSize: 14.sp))),
          ]);
        }
        final isVaccine = p.type == ProtocolType.vaccine;
        return Column(
          children: [
            BackHeader(
                title: p.name,
                subtitle: isVaccine ? 'تفاصيل المطعوم' : 'تفاصيل العلاج'),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: cardDecoration(),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: _badge(isVaccine),
                          ),
                          SizedBox(height: 8.h),
                          if (isVaccine) ...[
                            _row('التكرار', p.schedule ?? '—'),
                            _row('آخر تاريخ', _fmt(p.lastDate)),
                            _row('الجرعة القادمة', _fmt(p.nextDate)),
                          ] else ...[
                            _row('نوع المرض', p.diseaseType ?? '—'),
                            _row('فترة الجرعة', p.dosageInterval ?? '—'),
                            _row('آخر تاريخ', _fmt(p.lastDate)),
                            _row('الجرعة القادمة', _fmt(p.nextDate)),
                          ],
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    OutlinedButton.icon(
                      onPressed: () async {
                        await controller.deleteProtocol(p.id);
                        Get.back();
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.redBg,
                        side: const BorderSide(color: Color(0xFFFCA5A5)),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      icon: Icon(Icons.delete_outline,
                          color: AppColors.redFg, size: 18.sp),
                      label: Text('حذف هذا البروتوكول',
                          style: TextStyle(
                              color: AppColors.redFg,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  String _fmt(String? d) =>
      (d != null && d.isNotEmpty) ? AppDate.formatDate(d) : '—';

  Widget _badge(bool isVaccine) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
            color: isVaccine ? AppColors.blueBg : const Color(0xFFFFEDD5),
            borderRadius: BorderRadius.circular(20)),
        child: Text(isVaccine ? 'مطعوم' : 'علاج',
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: isVaccine ? AppColors.blueFg : const Color(0xFFC2410C))),
      );

  Widget _row(String label, String value) => Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Text(value,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(label,
                style: TextStyle(fontSize: 12.sp, color: AppColors.textMuted)),
          ],
        ),
      );
}
