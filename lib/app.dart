import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insighta/app_pages.dart';
import 'package:insighta/app_routes.dart';
import 'package:insighta/initial_binding.dart';
import 'package:insighta/styles/app_theme.dart';




class SmartFarmerApp extends StatelessWidget {
  const SmartFarmerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // مقاس تصميم مرجعي
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => GetMaterialApp(
        title: 'المزارع الذكي',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,//بتوزع الثيم على كل شاشات التطبيق
        // عربي RTL على مستوى التطبيق
        locale: const Locale('ar', 'SA'),
        fallbackLocale: const Locale('ar', 'SA'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'US')],
        builder: (context, child) => Directionality(//builder من getMaterialApp
          textDirection: TextDirection.rtl,//كل شاشات التطبيقمن اليمين لليسار 
          child: child!,//الشاشات اللي جوه builder
        ),
        initialBinding: InitialBinding(),
        initialRoute: Routes.login,
        getPages: AppPages.routes,
      ),
    );
  }
}