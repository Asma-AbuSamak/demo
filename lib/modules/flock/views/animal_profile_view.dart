import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/theme_x.dart';
import 'package:insighta/app_constants.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/sheep_svg.dart';
import 'package:insighta/models/animal/animal.dart';
import 'package:insighta/models/med_record/med_record.dart';
import 'package:insighta/models/weight_record/weight_record.dart';
import '../controllers/animal_profile_controller.dart';

class AnimalProfileView extends GetView<AnimalProfileController> {
  const AnimalProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.pageBg,
      body: Obx(() {
        final a = controller.animal.value;
        if (controller.isLoading.value && a == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (a == null) {
          return Center(child: Text('لم يُعثر على الحيوان', style: TextStyle(fontSize: 14.sp)));
        }
        return Column(
          children: [
            _header(a, context),
            _tabBar(context),
            Expanded(
              child: Obx(() {
                switch (controller.currentTab.value) {
                  case 0:
                    return _infoTab(a, context);
                  case 1:
                    return _medicalTab(a, context);
                  default:
                    return _familyTab(a, context);
                }
              }),
            ),
          ],
        );
      }),
    );
  }

  Widget _header(Animal a, BuildContext context) {
    final sv = StatusView.of(context, a.status);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 40.h, bottom: 18.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(gradient: context.palette.headerGradient),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.arrow_forward, color: Colors.white70, size: 16.sp),
              SizedBox(width: 4.w),
              Text(controller.backLabel,
                  style: TextStyle(color: Colors.white70, fontSize: 13.sp)),
            ]),
          ),
          SizedBox(height: 12.h),
          Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(a.id,
                      style: TextStyle(
                          color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.w900)),
                  SizedBox(height: 2.h),
                  Text('${a.breed} · ${a.gender == Gender.male ? "ذكر" : "أنثى"}',
                      style: TextStyle(color: Colors.white60, fontSize: 12.sp)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(color: sv.bg, borderRadius: BorderRadius.circular(20)),
                  child: Text(sv.label,
                      style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: sv.fg)),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(14)),
                  child: Center(child: SheepSVG(male: a.gender == Gender.male, size: 30)),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }

  Widget _tabBar(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(children: [
        _tab('البيانات', 0, context),
        _tab('السجل الطبي', 1, context),
        _tab('شجرة العائلة', 2, context),
      ]),
    );
  }

  Widget _tab(String label, int i, BuildContext context) {
    final active = controller.currentTab.value == i;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.currentTab.value = i,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: active ? context.colors.primary : Colors.transparent, width: 2.5),
            ),
          ),
          child: Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: active ? context.palette.successFg : context.palette.textMuted)),
        ),
      ),
    );
  }

  // ── تبويب البيانات ──
  Widget _infoTab(Animal a, BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        Row(children: [
          _infoCard('الجنس', a.gender == Gender.male ? 'ذكر' : 'أنثى', context),
          SizedBox(width: 10.w),
          _infoCard('السلالة', a.breed, context),
        ]),
        SizedBox(height: 10.h),
        Row(children: [
          _infoCard('العمر', controller.ageText, context),
          SizedBox(width: 10.w),
          _infoCard('الوزن الأخير', '${a.weightGrams != null ? (a.weightGrams! / 1000).toStringAsFixed(0) : '—'} كغ', context),
        ]),
        SizedBox(height: 10.h),
        Row(children: [
          _infoCard('تاريخ الميلاد', a.birthDateUtc != null ? AppDate.formatEpoch(a.birthDateUtc!) : '—', context),
          SizedBox(width: 10.w),
          _infoCard('المصدر', a.origin == Origin.born ? 'مولود' : 'مشترى', context),
        ]),
        if (a.origin == Origin.purchased && a.vendorId != null) ...[
          SizedBox(height: 10.h),
          Row(children: [
            _infoCard('المورد', a.vendorId!, context),
            SizedBox(width: 10.w),
            _infoCard('سعر الشراء', a.purchasePriceMinor != null ? '${(a.purchasePriceMinor! / 100).toStringAsFixed(0)} ${a.currency}' : '—', context),
          ]),
        ],
        SizedBox(height: 14.h),
        _weightsCard(context),
      ],
    );
  }

  Widget _infoCard(String label, String value, BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: cardDecoration(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(label, style: TextStyle(fontSize: 11.sp, color: context.palette.textMuted)),
            SizedBox(height: 4.h),
            Text(value,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.end),
          ],
        ),
      ),
    );
  }

  Widget _weightsCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text('آخر الأوزان',
                style: TextStyle(
                    fontSize: 12.sp, fontWeight: FontWeight.bold, color: context.palette.textMuted)),
          ),
          if (controller.lastWeights.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text('لا توجد سجلات وزن',
                  style: TextStyle(fontSize: 12.sp, color: context.palette.textMuted)),
            )
          else
            ...controller.lastWeights.map((w) => _weightRow(w, context)),
        ],
      ),
    );
  }

  Widget _weightRow(WeightRecord w, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(children: [
        Container(
          width: 8.w,
          height: 8.w,
          decoration: BoxDecoration(
              color: w.syncStatus == 'synced' ? context.colors.primary : context.palette.brandAccent, shape: BoxShape.circle),
        ),
        SizedBox(width: 8.w),
        Text(AppDate.formatEpoch(w.dateUtc),
            style: TextStyle(fontSize: 11.sp, color: context.palette.textMuted)),
        const Spacer(),
        Text('${w.weight.toStringAsFixed(0)} كغ',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900)),
      ]),
    );
  }

  // ── تبويب السجل الطبي ──
  Widget _medicalTab(Animal a, BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        if (controller.hasAction) _actionButton(a, context),
        ...controller.records.map((r) => _recordCard(r, context)),
        if (controller.records.isEmpty)
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Center(
              child: Text('لا توجد سجلات طبية',
                  style: TextStyle(color: context.palette.textMuted, fontSize: 13.sp)),
            ),
          ),
      ],
    );
  }

  Widget _actionButton(Animal a, BuildContext context) {
    final isSick = a.status == AnimalStatus.sick;
    final color = isSick ? context.palette.primaryStrong : context.palette.brandAccent;
    final icon = isSick ? Icons.check_circle : Icons.favorite;
    final label = isSick ? 'تم الشفاء - تسجيل التعافي الآن' : 'تمت الولادة - تسجيل الولادة الآن';
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: controller.registerAction,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          icon: Icon(icon, color: Colors.white, size: 18.sp),
          label: Text(label,
              style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _recordCard(MedRecord r, BuildContext context) {
    final mv = MedTypeView.of(context, r.type);
    final dotColor = r.syncStatus == 'synced' ? context.colors.primary : context.palette.brandAccent;
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(14.w),
      decoration: cardDecoration(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(color: mv.bg, borderRadius: BorderRadius.circular(20)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(mv.icon, size: 12.sp, color: mv.fg),
                      SizedBox(width: 3.w),
                      Text(mv.label,
                          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: mv.fg)),
                    ]),
                  ),
                  SizedBox(width: 8.w),
                  Text(AppDate.formatEpoch(r.dateUtc),
                      style: TextStyle(fontSize: 11.sp, color: context.palette.textMuted)),
                ]),
                SizedBox(height: 6.h),
                Text(r.description,
                    style: TextStyle(
                        fontSize: 13.sp, fontWeight: FontWeight.w600, color: context.palette.textMain)),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 9.w,
            height: 9.w,
            margin: EdgeInsets.only(top: 4.h),
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }

  // ── تبويب شجرة العائلة (نسخة بسيطة للـ Demo) ──
  Widget _familyTab(Animal a, BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        SizedBox(height: 6.h),
        Center(
          child: Text('شجرة الأنساب - 3 أجيال',
              style: TextStyle(fontSize: 11.sp, color: context.palette.textMuted)),
        ),
        SizedBox(height: 16.h),
        // عقدة الخروف
        Center(child: _node('الخروف', a.id, context, primary: true)),
        // الوصلة
        Center(
          child: Container(width: 2.w, height: 24.h, color: context.colors.primary),
        ),
        // الأبوان
        Row(
          children: [
            Expanded(child: _parentNode('الأب', a.fatherId, context)),
            SizedBox(width: 12.w),
            Expanded(child: _parentNode('الأم', a.motherId, context)),
          ],
        ),
      ],
    );
  }

  Widget _parentNode(String label, String? id, BuildContext context) {
    if (id == null || id.isEmpty) {
      return _node(label, 'غير معروف', context, muted: true);
    }
    return GestureDetector(
      onTap: () => controller.openParent(id),
      child: _node(label, id, context),
    );
  }

  Widget _node(String label, String value, BuildContext context, {bool primary = false, bool muted = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
      decoration: BoxDecoration(
        gradient: primary ? context.palette.headerGradient : null,
        color: primary ? null : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: primary ? null : Border.all(color: context.palette.border),
        boxShadow: primary ? null : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
      ),
      child: Column(
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 10.sp,
                  color: primary ? Colors.white70 : context.palette.textMuted)),
          SizedBox(height: 2.h),
          Text(value,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: primary
                      ? Colors.white
                      : muted
                          ? context.palette.textMuted
                          : context.palette.textMain)),
        ],
      ),
    );
  }
}
