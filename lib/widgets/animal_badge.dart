import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/models/animal/animal.dart';
import 'package:insighta/styles/theme_x.dart';
import 'sheep_svg.dart';

/// بطاقة تعريف مصغّرة للحيوان فوق
/// في العمليات
class AnimalBadge extends StatelessWidget {
  final Animal animal;//object من نوع حيوان
  const AnimalBadge({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.palette.accentLight,
        border: Border.all(color: const Color(0xFFA7F3D0)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SheepSVG(male: animal.gender == Gender.male, size: 36),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(animal.id,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: context.palette.successFg)),
              Text(
                '${animal.breed} · ${animal.gender == Gender.male ? "ذكر" : "أنثى"}',
                style: TextStyle(fontSize: 11.sp, color: context.palette.primaryStrong),
              ),
            ],
          ),
        ],
      ),
    );
  }
}