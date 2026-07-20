import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insighta/styles/app_colors.dart';

class OpItem {
  final String label;
  final String sub;
  final IconData icon;
  final List<Color> gradient;
  final String route;
  const OpItem(this.label, this.sub, this.icon, this.gradient, this.route);
}

class FieldOpsController extends GetxController {
  final List<OpItem> ops = const [
    OpItem('تسجيل وزن', 'قياس وتسجيل وزن خروف', Icons.scale,
        [Color(0xFF34D399), AppColors.teal600], '/op/weight'),
    OpItem('تسجيل علاج / فحص', 'تطعيمات، أدوية، فحوصات دورية',
        Icons.medical_services_outlined,
        [Color(0xFF38BDF8), Color(0xFF2563EB)], '/op/medical'),
    OpItem('ولادة وتزاوج', 'تسجيل ولادة أو تزاوج مع كشف القرابة',
        Icons.favorite,
        [Color(0xFFA78BFA), Color(0xFF7C3AED)], '/op/birth-breeding'),
    OpItem('تعديل بيانات', 'تعديل معلومات خروف موجود', Icons.edit_outlined,
        [Color(0xFF94A3B8), Color(0xFF4B5563)], '/op/edit'),
    OpItem('ازالة', 'وفاة أو بيع', Icons.delete_outline,
        [Color(0xFFF87171), Color(0xFFE11D48)], '/op/delete'),
    OpItem('علاجات ومطاعيم', 'جداول التطعيم والعلاج الدوري', Icons.vaccines,
        [Color(0xFF2DD4BF), Color(0xFF0891B2)], '/protocols'),
  ];
}
