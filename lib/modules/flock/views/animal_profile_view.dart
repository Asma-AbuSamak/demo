import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/app_constants.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/sheep_svg.dart';
import 'package:insighta/models/animal.dart';
import 'package:insighta/models/med_record.dart';
import 'package:insighta/models/weight_record.dart';
import '../controllers/animal_profile_controller.dart';

class AnimalProfileView extends GetView<AnimalProfileController> {
  const AnimalProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
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
            _header(a),
            _tabBar(),
            Expanded(
              child: Obx(() {
                switch (controller.currentTab.value) {
                  case 0:
                    return _infoTab(a);
                  case 1:
                    return _medicalTab(a);
                  default:
                    return _familyTab(a);
                }
              }),
            ),
          ],
        );
      }),
    );
  }

  Widget _header(Animal a) {
    final sv = StatusView.of(a.status);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 40.h, bottom: 18.h, left: 16.w, right: 16.w),
      decoration: const BoxDecoration(gradient: AppColors.headerGradient),
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

  Widget _tabBar() {
    return Container(
      color: Colors.white,
      child: Row(children: [
        _tab('البيانات', 0),
        _tab('السجل الطبي', 1),
        _tab('شجرة العائلة', 2),
      ]),
    );
  }

  Widget _tab(String label, int i) {
    final active = controller.currentTab.value == i;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.currentTab.value = i,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: active ? AppColors.primary : Colors.transparent, width: 2.5),
            ),
          ),
          child: Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: active ? AppColors.emeraldFg : AppColors.textMuted)),
        ),
      ),
    );
  }

  // ── تبويب البيانات ──
  Widget _infoTab(Animal a) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        Row(children: [
          _infoCard('الجنس', a.gender == Gender.male ? 'ذكر' : 'أنثى'),
          SizedBox(width: 10.w),
          _infoCard('السلالة', a.breed),
        ]),
        SizedBox(height: 10.h),
        Row(children: [
          _infoCard('العمر', controller.ageText),
          SizedBox(width: 10.w),
          _infoCard('الوزن الأخير', '${a.weight.toStringAsFixed(0)} كغ'),
        ]),
        SizedBox(height: 10.h),
        Row(children: [
          _infoCard('تاريخ الميلاد', AppDate.formatDate(a.birthDate)),
          SizedBox(width: 10.w),
          _infoCard('المصدر', a.origin == Origin.born ? 'مولود' : 'مشترى'),
        ]),
        if (a.origin == Origin.purchased && a.vendorName != null) ...[
          SizedBox(height: 10.h),
          Row(children: [
            _infoCard('المورد', a.vendorName!),
            SizedBox(width: 10.w),
            _infoCard('سعر الشراء', a.purchasePrice != null ? '${a.purchasePrice} ر' : '—'),
          ]),
        ],
        SizedBox(height: 14.h),
        _weightsCard(),
      ],
    );
  }

  Widget _infoCard(String label, String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(label, style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted)),
            SizedBox(height: 4.h),
            Text(value,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.end),
          ],
        ),
      ),
    );
  }

  Widget _weightsCard() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text('آخر الأوزان',
                style: TextStyle(
                    fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.textMuted)),
          ),
          if (controller.lastWeights.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text('لا توجد سجلات وزن',
                  style: TextStyle(fontSize: 12.sp, color: AppColors.textMuted)),
            )
          else
            ...controller.lastWeights.map(_weightRow),
        ],
      ),
    );
  }

  Widget _weightRow(WeightRecord w) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(children: [
        Container(
          width: 8.w,
          height: 8.w,
          decoration: BoxDecoration(
              color: w.synced ? AppColors.primary : AppColors.amber, shape: BoxShape.circle),
        ),
        SizedBox(width: 8.w),
        Text(AppDate.formatDate(w.date),
            style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted)),
        const Spacer(),
        Text('${w.weight.toStringAsFixed(0)} كغ',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900)),
      ]),
    );
  }

  // ── تبويب السجل الطبي ──
  Widget _medicalTab(Animal a) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        if (controller.hasAction) _actionButton(a),
        ...controller.records.map(_recordCard),
        if (controller.records.isEmpty)
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Center(
              child: Text('لا توجد سجلات طبية',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 13.sp)),
            ),
          ),
      ],
    );
  }

  Widget _actionButton(Animal a) {
    final isSick = a.status == AnimalStatus.sick;
    final color = isSick ? AppColors.primaryDark : AppColors.amber;
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

  Widget _recordCard(MedRecord r) {
    final mv = MedTypeView.of(r.type);
    final dotColor = r.synced ? AppColors.primary : AppColors.amber;
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(14.w),
      decoration: cardDecoration(),
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
                  Text(AppDate.formatDate(r.date),
                      style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted)),
                ]),
                SizedBox(height: 6.h),
                Text(r.description,
                    style: TextStyle(
                        fontSize: 13.sp, fontWeight: FontWeight.w600, color: AppColors.textMain)),
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
  Widget _familyTab(Animal a) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        SizedBox(height: 6.h),
        Center(
          child: Text('شجرة الأنساب - 3 أجيال',
              style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted)),
        ),
        SizedBox(height: 16.h),
        // عقدة الخروف
        Center(child: _node('الخروف', a.id, primary: true)),
        // الوصلة
        Center(
          child: Container(width: 2.w, height: 24.h, color: AppColors.primary),
        ),
        // الأبوان
        Row(
          children: [
            Expanded(child: _parentNode('الأب', a.fatherId)),
            SizedBox(width: 12.w),
            Expanded(child: _parentNode('الأم', a.motherId)),
          ],
        ),
      ],
    );
  }

  Widget _parentNode(String label, String? id) {
    if (id == null || id.isEmpty) {
      return _node(label, 'غير معروف', muted: true);
    }
    return GestureDetector(
      onTap: () => controller.openParent(id),
      child: _node(label, id),
    );
  }

  Widget _node(String label, String value, {bool primary = false, bool muted = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
      decoration: BoxDecoration(
        gradient: primary ? AppColors.headerGradient : null,
        color: primary ? null : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: primary ? null : Border.all(color: AppColors.border),
        boxShadow: primary ? null : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
      ),
      child: Column(
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 10.sp,
                  color: primary ? Colors.white70 : AppColors.textMuted)),
          SizedBox(height: 2.h),
          Text(value,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: primary
                      ? Colors.white
                      : muted
                          ? AppColors.textMuted
                          : AppColors.textMain)),
        ],
      ),
    );
  }
}
