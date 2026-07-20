import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/app_constants.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/back_header.dart';
import 'package:insighta/widgets/sheep_svg.dart';
import 'package:insighta/models/animal.dart';
import '../controllers/animal_list_controller.dart';

class AnimalListView extends GetView<AnimalListController> {
  const AnimalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Column(
        children: [
          Obx(() => BackHeader(
                title: controller.title,
                subtitle: '${controller.animals.length} خروف',
              )),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.animals.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle_outline,
                          size: 48.sp, color: AppColors.primary),
                      SizedBox(height: 8.h),
                      Text('لا يوجد خرفان في هذه القائمة 🎉',
                          style: TextStyle(
                              fontSize: 14.sp, color: AppColors.textMuted)),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: controller.animals.length,
                itemBuilder: (_, i) => _card(controller.animals[i]),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: Obx(() => _scanFab()),
    );
  }

  Widget _card(Animal a) {
    final latest = controller.latestByAnimal[a.id];
    final subtitle = latest == null
        ? '${a.breed} · ${a.weight.toStringAsFixed(0)} كغ'
        : '${MedTypeView.of(latest.type).label}: ${latest.description}';

    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: GestureDetector(
        onTap: () => controller.openProfile(a.id),
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: cardDecoration(),
          child: Row(
            children: [
              Column(
                children: [
                  Icon(Icons.chevron_left, size: 18.sp, color: const Color(0xFFD1D5DB)),
                  Text('السجل الطبي',
                      style: TextStyle(fontSize: 10.sp, color: AppColors.primaryDark)),
                ],
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(a.id,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp)),
                    SizedBox(height: 2.h),
                    Text(subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted)),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                    color: AppColors.accentLight,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(child: SheepSVG(male: a.gender == Gender.male, size: 32)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _scanFab() {
    final scanning = controller.scanning.value;
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.headerGradient,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12)],
      ),
      child: SizedBox(
        width: 58.w,
        height: 58.w,
        child: IconButton(
          onPressed: scanning ? null : controller.scanAndOpen,
          icon: scanning
              ? SizedBox(
                  width: 22.w,
                  height: 22.w,
                  child: const CircularProgressIndicator(
                      strokeWidth: 2.5, color: Colors.white))
              : Icon(Icons.qr_code_scanner, color: Colors.white, size: 26.sp),
        ),
      ),
    );
  }
}
