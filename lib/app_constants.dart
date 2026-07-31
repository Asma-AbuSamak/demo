import 'package:flutter/material.dart';
import 'package:insighta/models/animal/animal.dart';
import 'package:insighta/models/med_record/med_record.dart';
import 'package:insighta/styles/theme_x.dart';


/// كل القوائم الثابتة والخيارات (مطابقة لملف React).
class AppConstants {
  /// <look up data> 
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

  static StatusView of(BuildContext context, AnimalStatus s) {
    switch (s) {
      case AnimalStatus.healthy:
        return StatusView('بصحة جيدة', context.palette.successBg, context.palette.successFg);
      case AnimalStatus.sick:
        return StatusView('مريض', context.palette.dangerBg, context.palette.dangerFg);
      case AnimalStatus.pregnant:
        return StatusView('حامل', context.palette.warningBg, context.palette.warningFg);
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

  static MedTypeView of(BuildContext context, MedType t) {
    switch (t) {
      case MedType.vaccine:
        return MedTypeView('تطعيم', context.palette.infoBg, context.palette.infoFg, Icons.shield_outlined);
      case MedType.treatment:
        return MedTypeView('علاج', context.palette.dangerBg, context.palette.dangerFg, Icons.medical_services_outlined);
      case MedType.checkup:
        return MedTypeView('فحص', context.palette.successBg, context.palette.successFg, Icons.monitor_heart_outlined);
    }
  }
}