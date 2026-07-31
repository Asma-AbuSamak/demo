import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/app_routes.dart';
import 'package:insighta/styles/theme_x.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/models/vaccine_protocol/vaccine_protocol.dart';
import '../controllers/protocols_controller.dart';

class ProtocolsView extends GetView<ProtocolsController> {
  const ProtocolsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.pageBg,
      body: Column(
        children: [
          const BackHeader(
              title: 'علاجات ومطاعيم', subtitle: 'جداول التطعيم والعلاج'),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(
                padding: EdgeInsets.all(16.w),
                children: [
                  Row(children: [
                    Expanded(child: _addBtn('+  إضافة علاج',
                        const Color(0xFFEA580C), ProtocolType.treatment)),
                    SizedBox(width: 10.w),
                    Expanded(child: _addBtn('+  إضافة مطعوم',
                        context.palette.infoFg, ProtocolType.vaccine)),
                  ]),
                  SizedBox(height: 16.h),
                  _sectionLabel('المطاعيم', context),
                  ...controller.vaccines.map((p) => _vaccineCard(p, context)),
                  SizedBox(height: 16.h),
                  _sectionLabel('العلاجات', context),
                  ...controller.treatments.map((p) => _treatmentCard(p, context)),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _addBtn(String label, Color color, ProtocolType type) {
    return GestureDetector(
      onTap: () {
        controller.resetForm();
        Get.toNamed(Routes.protocolAdd, arguments: type);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)),
        child: Text(label,
            style: TextStyle(
                color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _sectionLabel(String t, BuildContext context) => Padding(
        padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(t,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: context.palette.textMuted)),
        ),
      );

  Widget _vaccineCard(VaccineProtocol p, BuildContext context) {
    final overdue = controller.isOverdue(p);
    return _card(
      p: p,
      context: context,
      badges: [
        _pill('مطعوم', context.palette.infoBg, context.palette.infoFg),
        if (overdue) _pill('متأخر', context.palette.dangerBg, context.palette.dangerFg),
      ],
      subtitle:
          '${p.schedule ?? ""} · الجرعة القادمة ${p.nextDateUtc != null ? AppDate.formatEpoch(p.nextDateUtc!) : "—"}',
    );
  }

  Widget _treatmentCard(VaccineProtocol p, BuildContext context) {
    return _card(
      p: p,
      context: context,
      badges: [_pill('علاج', const Color(0xFFFFEDD5), const Color(0xFFC2410C))],
      subtitle: '${p.diseaseType ?? ""} · ${p.dosageInterval ?? ""}',
    );
  }

  Widget _card({
    required VaccineProtocol p,
    required List<Widget> badges,
    required String subtitle,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.protocolDetail, arguments: p.id),
        child: Container(
          padding: EdgeInsets.all(14.w),
          decoration: cardDecoration(context),
          child: Row(
            children: [
              Icon(Icons.chevron_left, size: 18.sp, color: const Color(0xFFD1D5DB)),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        for (final b in badges) ...[b, SizedBox(width: 6.w)],
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Text(p.name,
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2.h),
                    Text(subtitle,
                        style: TextStyle(
                            fontSize: 11.sp, color: context.palette.textMuted)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pill(String text, Color bg, Color fg) => Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
        child: Text(text,
            style: TextStyle(
                fontSize: 10.sp, fontWeight: FontWeight.bold, color: fg)),
      );
}
