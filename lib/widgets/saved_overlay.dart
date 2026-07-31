import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/styles/theme_x.dart';

///  كل عملية "حفظ" ناجحة (وزن، علاج، حذف، تعديل، إضافة، ولادة) بتعرض هاي الشاشة "تم الحفظ!" لمدة قصيرة
class SavedOverlay extends StatelessWidget {
  final String message;
  const SavedOverlay({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(//بتاخد قياسات الشاشة
      builder: (_, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                        color: context.palette.accentGreen, shape: BoxShape.circle),
                    child: Icon(Icons.check_circle,
                        color: context.palette.primaryStrong, size: 40.sp),
                  ),
                  SizedBox(height: 16.h),
                  Text('تم الحفظ!',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900,
                          color: context.palette.textMain)),
                  SizedBox(height: 4.h),
                  Text(message,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13.sp, color: context.palette.textMuted)),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.schedule, size: 14.sp, color: context.palette.brandAccent),
                      SizedBox(width: 4.w),
                      Text('محفوظ محلياً – سيتزامن عند الاتصال',
                          style: TextStyle(fontSize: 11.sp, color: context.palette.brandAccent)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}