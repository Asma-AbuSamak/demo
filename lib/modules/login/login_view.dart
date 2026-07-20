import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insighta/modules/login/login_controller.dart';
import 'package:insighta/styles/app_colors.dart';
import 'package:insighta/widgets/app_field.dart';
import 'package:insighta/widgets/sheep_svg.dart';


class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Column(
        children: [
          // القسم العلوي الأخضر: الشعار + الاسم
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 70.h, bottom: 40.h),
            decoration: const BoxDecoration(
              gradient: AppColors.headerGradient,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
            ),
            child: Column(
              children: [
                Container(
                  width: 84.w,
                  height: 84.w,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(child: SheepSVG(size: 56)),
                ),
                SizedBox(height: 14.h),
                Text('المزارع الذكي',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w900)),
                SizedBox(height: 4.h),
                Text('نظام إدارة الحلال',
                    style: TextStyle(color: Colors.white70, fontSize: 13.sp)),
              ],
            ),
          ),
          // النموذج
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('تسجيل الدخول',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                          color: AppColors.textMain)),
                  SizedBox(height: 20.h),
                  AppField(
                    label: 'البريد الإلكتروني',
                    child: TextField(
                      onChanged: (v) => controller.email.value = v,
                      decoration: appInputDecoration('example@farm.com'),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  AppField(
                    label: 'كلمة المرور',
                    child: TextField(
                      obscureText: true,
                      onChanged: (v) => controller.password.value = v,
                      decoration: appInputDecoration('••••••••'),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton.icon(
                    onPressed: controller.login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryDark,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    icon: Icon(Icons.login, color: Colors.white, size: 18.sp),
                    label: Text('دخول',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 16.h),
                  Row(children: [
                    const Expanded(child: Divider(color: AppColors.border)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text('أو',
                          style: TextStyle(
                              color: AppColors.textMuted, fontSize: 12.sp)),
                    ),
                    const Expanded(child: Divider(color: AppColors.border)),
                  ]),
                  SizedBox(height: 16.h),
                  OutlinedButton(
                    onPressed: controller.continueAsGuest,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      side: const BorderSide(color: AppColors.border),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: Text('المتابعة بدون تسجيل دخول',
                        style: TextStyle(
                            color: AppColors.textMain,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(height: 16.h),
                  Text('البيانات محفوظة محلياً ويمكن مزامنتها لاحقاً',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.textMuted, fontSize: 11.sp)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}