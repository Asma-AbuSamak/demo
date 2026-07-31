import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

import 'package:insighta/styles/theme_x.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/models/vaccine_protocol/vaccine_protocol.dart';
import '../controllers/protocols_controller.dart';

class ProtocolDetailView extends GetView<ProtocolsController> {
  const ProtocolDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments as String;
    return Scaffold(
      backgroundColor: context.palette.pageBg,
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
                      decoration: cardDecoration(context),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: _badge(isVaccine, context),
                          ),
                          SizedBox(height: 8.h),
                          if (isVaccine) ...[
                            _row('التكرار', p.schedule ?? '—', context),
                            _row('آخر تاريخ', _fmt(p.lastDateUtc), context),
                            _row('الجرعة القادمة', _fmt(p.nextDateUtc), context),
                          ] else ...[
                            _row('نوع المرض', p.diseaseType ?? '—', context),
                            _row('فترة الجرعة', p.dosageInterval ?? '—', context),
                            _row('آخر تاريخ', _fmt(p.lastDateUtc), context),
                            _row('الجرعة القادمة', _fmt(p.nextDateUtc), context),
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
                        backgroundColor: context.palette.dangerBg,
                        side: const BorderSide(color: Color(0xFFFCA5A5)),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      icon: Icon(Icons.delete_outline,
                          color: context.palette.dangerFg, size: 18.sp),
                      label: Text('حذف هذا البروتوكول',
                          style: TextStyle(
                              color: context.palette.dangerFg,
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

  String _fmt(int? d) => d != null ? AppDate.formatEpoch(d) : '—';

  Widget _badge(bool isVaccine, BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
            color: isVaccine ? context.palette.infoBg : const Color(0xFFFFEDD5),
            borderRadius: BorderRadius.circular(20)),
        child: Text(isVaccine ? 'مطعوم' : 'علاج',
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: isVaccine ? context.palette.infoFg : const Color(0xFFC2410C))),
      );

  Widget _row(String label, String value, BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Text(value,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(label,
                style: TextStyle(fontSize: 12.sp, color: context.palette.textMuted)),
          ],
        ),
      );
}
