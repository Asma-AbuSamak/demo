import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insighta/app_routes.dart';
import 'package:insighta/modules/dashboard/dashboard_view.dart';
import 'package:insighta/modules/field_ops/views/field_ops_view.dart';
import 'package:insighta/modules/flock/controllers/flock_controller.dart';
import 'package:insighta/modules/flock/views/flock_view.dart';
import 'package:insighta/modules/inventory/views/inventory_view.dart';
import 'package:insighta/modules/shell/nav_controller.dart';
import 'package:insighta/styles/app_colors.dart';


class MainShellView extends GetView<NavController> {
  const MainShellView({super.key});

  static const _tabs = [
    DashboardView(),
    FieldOpsView(),
    FlockView(),
    InventoryView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Column(
        children: [
          _sharedHeader(),
          Expanded(
            child: Obx(() => IndexedStack(
                  index: controller.currentIndex.value,
                  children: _tabs,
                )),
          ),
        ],
      ),
      floatingActionButton: Obx(() => _fab(controller.currentIndex.value)),
      bottomNavigationBar: _bottomNav(),
    );
  }

  // الهيدر الأخضر المشترك: التاريخ + العنوان + شارة المزامنة
  Widget _sharedHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 44.h, bottom: 16.h, left: 20.w, right: 20.w),
      decoration: const BoxDecoration(gradient: AppColors.headerGradient),
      child: Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.todayStr,
                      style: TextStyle(color: Colors.white54, fontSize: 11.sp)),
                  SizedBox(height: 2.h),
                  Text(controller.currentTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                          height: 1.1)),
                ],
              ),
            ),
            _syncBadge(),
          ],
        ),
      ),
    );
  }

  Widget _syncBadge() {
    final synced = controller.pendingSync.value == 0;
    return GestureDetector(
      onTap: controller.sync,
      child: Container(
        margin: EdgeInsets.only(top: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(synced ? Icons.check_circle : Icons.sync,
                color: Colors.white, size: 14.sp),
            SizedBox(width: 5.w),
            Text(
              synced
                  ? 'متزامن'
                  : controller.syncing.value
                      ? 'جاري...'
                      : '${controller.pendingSync.value} انتظار',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fab(int index) {
    if (index != 0 && index != 2) return const SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.headerGradient,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12)],
      ),
      child: SizedBox(
        width: 56.w,
        height: 56.w,
        child: IconButton(
          onPressed: () => index == 0
              ? Get.toNamed(Routes.addAnimal)
              : Get.find<FlockController>().scanAndOpen(),
          icon: Icon(index == 0 ? Icons.add : Icons.qr_code_scanner,
              color: Colors.white, size: 28.sp),
        ),
      ),
    );
  }

  Widget _bottomNav() {
    return Obx(
      () => NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStatePropertyAll(
              TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600)),
        ),
        child: NavigationBar(
          height: 62.h,
          backgroundColor: Colors.white,
          indicatorColor: AppColors.accentLight,
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.changeTab,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard, color: AppColors.primaryDark),
                label: 'الرئيسية'),
            NavigationDestination(
                icon: Icon(Icons.qr_code_scanner_outlined),
                selectedIcon: Icon(Icons.qr_code_scanner, color: AppColors.primaryDark),
                label: 'العمليات'),
            NavigationDestination(
                icon: Icon(Icons.list_alt_outlined),
                selectedIcon: Icon(Icons.list_alt, color: AppColors.primaryDark),
                label: 'الحلال'),
            NavigationDestination(
                icon: Icon(Icons.inventory_2_outlined),
                selectedIcon: Icon(Icons.inventory_2, color: AppColors.primaryDark),
                label: 'المخزن'),
          ],
        ),
      ),
    );
  }
}