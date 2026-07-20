import 'package:flutter/material.dart';
import 'package:insighta/models/animal.dart';
import 'package:insighta/models/med_record.dart';
import 'package:insighta/styles/app_colors.dart';


/// كل القوائم الثابتة والخيارات (مطابقة لملف React).
class AppConstants {
  static const List<String> breeds = [
    'نجدي', 'نعيمي', 'حجازي', 'عوسي', 'بربري', 'رومانوف', 'أوسيمي',
  ];

  static const List<String> deathCausesDefault = [
    'مرض وبائي', 'مرض مزمن', 'حادث', 'مضاعفات الولادة', 'شيخوخة', 'مجهول السبب',
  ];

  static const List<String> vaccineNamesDefault = [
    'تطعيم الحمى القلاعية', 'تطعيم الجدري', 'تطعيم البروسيلا',
    'لقاح الطاعون الصغير', 'تطعيم الكزاز',
  ];

  static const List<String> treatmentNamesDefault = [
    'أوكسي تتراسيكلين 20%', 'إيفرمكتين 1%', 'بنسلين G',
    'أموكسيسيلين', 'دكساميثازون', 'فيتامين E + سيلينيوم',
  ];

  static const List<String> diseaseTypesDefault = [
    'طفيليات خارجية', 'طفيليات داخلية', 'التهاب رئوي', 'إسهال', 'نفاخ', 'تسمم الدم',
  ];

  static const List<String> checkupTypesDefault = [
    'فحص الحمل', 'فحص دوري', 'متابعة علاج', 'فحص ما بعد الولادة',
  ];

  static const List<Map<String, dynamic>> scheduleOptions = [
    {'val': 'annual', 'label': 'سنوياً', 'months': 12},
    {'val': '6months', 'label': 'كل 6 أشهر', 'months': 6},
    {'val': '2months', 'label': 'كل شهرين', 'months': 2},
    {'val': 'once', 'label': 'مرة واحدة', 'months': 0},
  ];

  static const List<String> units = ['زجاجة', 'علبة', 'كيس', 'أنبوب', 'حبة'];
}

/// عرض الحالة (label + ألوان الشارة).
class StatusView {
  final String label;
  final Color bg;
  final Color fg;
  const StatusView(this.label, this.bg, this.fg);

  static StatusView of(AnimalStatus s) {
    switch (s) {
      case AnimalStatus.healthy:
        return const StatusView('بصحة جيدة', AppColors.emeraldBg, AppColors.emeraldFg);
      case AnimalStatus.sick:
        return const StatusView('مريض', AppColors.redBg, AppColors.redFg);
      case AnimalStatus.pregnant:
        return const StatusView('حامل', AppColors.yellowBg, AppColors.yellowFg);
    }
  }
}

/// عرض نوع السجل الطبي (label + ألوان + أيقونة).
class MedTypeView {
  final String label;
  final Color bg;
  final Color fg;
  final IconData icon;
  const MedTypeView(this.label, this.bg, this.fg, this.icon);

  static MedTypeView of(MedType t) {
    switch (t) {
      case MedType.vaccine:
        return const MedTypeView('تطعيم', AppColors.blueBg, AppColors.blueFg, Icons.shield_outlined);
      case MedType.treatment:
        return const MedTypeView('علاج', AppColors.redBg, AppColors.redFg, Icons.medical_services_outlined);
      case MedType.checkup:
        return const MedTypeView('فحص', AppColors.emeraldBg, AppColors.emeraldFg, Icons.monitor_heart_outlined);
    }
  }
}