import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/theme_x.dart';
import 'package:insighta/app_constants.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/sheep_svg.dart';
import 'package:insighta/models/animal/animal.dart';
import '../controllers/flock_controller.dart';

class FlockView extends GetView<FlockController> {
  const FlockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
          child: Container(
            decoration: cardDecoration(context, radius: BorderRadius.circular(12)),
            child: TextField(
              textAlign: TextAlign.right,
              onChanged: (v) => controller.search.value = v,
              decoration: InputDecoration(
                hintText: 'البحث بالـ ID أو السلالة',
                prefixIcon: Icon(Icons.search, color: context.palette.textMuted),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              ),
            ),
          ),
        ),
        Obx(() => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('${controller.filtered.length} خروف',
                    style: TextStyle(fontSize: 11.sp, color: context.palette.textMuted)),
              ),
            )),
        SizedBox(height: 8.h),
        Expanded(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            final list = controller.filtered;
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 90.h),
              itemCount: list.length,
              itemBuilder: (_, i) => _tile(list[i], context),
            );
          }),
        ),
      ],
    );
  }

  Widget _tile(Animal a, BuildContext context) {
    final sv = StatusView.of(context, a.status);
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: GestureDetector(
        onTap: () => controller.openProfile(a.id),
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: cardDecoration(context),
          child: Row(
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                    color: context.palette.accentLight,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(child: SheepSVG(male: a.gender == Gender.male, size: 32)),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(a.id,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.sp)),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                            color: sv.bg, borderRadius: BorderRadius.circular(20)),
                        child: Text(sv.label,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: sv.fg)),
                      ),
                    ]),
                    SizedBox(height: 2.h),
                    Text('${a.breed} · ${a.weightGrams != null ? (a.weightGrams! / 1000).toStringAsFixed(0) : '—'} كغ',
                        style: TextStyle(
                            fontSize: 11.sp, color: context.palette.textMuted)),
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
}
