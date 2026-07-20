import 'package:flutter/material.dart';

/// شعار الخروف — منقول من SVG في React إلى CustomPainter.
/// جسم قطني (دوائر متداخلة #e2e8f0)، رأس رمادي، عين، أذنان، 4 أرجل بحوافر،
/// ذيل، وقرون بنية منحنية للذكور.
/// في 7 صفحات ستخدم وبتغير من هون بس 
class SheepSVG extends StatelessWidget {
  final bool male;
  final double size;
  const SheepSVG({super.key, this.male = false, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _SheepPainter(male: male)),
      ),
    );
  }
}

class _SheepPainter extends CustomPainter {
  final bool male;
  _SheepPainter({required this.male});

  static const _wool = Color(0xFFE2E8F0);
  static const _slate = Color(0xFF94A3B8);
  static const _dark = Color(0xFF1E293B);
  static const _leg = Color(0xFF64748B);
  static const _hoof = Color(0xFF374151);
  static const _tail = Color(0xFFCBD5E1);
  static const _horn = Color(0xFF92400E);

  @override
  void paint(Canvas canvas, Size size) {
    // مقياس من نظام viewBox 80x80 إلى الحجم الفعلي
    final s = size.width / 80.0;
    Offset p(double x, double y) => Offset(x * s, y * s);
    double r(double v) => v * s;
    final fill = Paint()..style = PaintingStyle.fill;

    // الأرجل + الحوافر
    fill.color = _leg;
    for (final leg in [
      [28.0, 58.0, 5.0, 14.0],
      [35.0, 59.0, 5.0, 13.0],
      [42.0, 59.0, 5.0, 13.0],
      [49.0, 58.0, 5.0, 14.0],
    ]) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(leg[0] * s, leg[1] * s, leg[2] * s, leg[3] * s),
          Radius.circular(r(2.5)),
        ),
        fill,
      );
    }
    fill.color = _hoof;
    for (final x in [28.0, 35.0, 42.0, 49.0]) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x * s, 69 * s, 5 * s, 3 * s),
          Radius.circular(r(1.5)),
        ),
        fill,
      );
    }

    // الذيل
    fill.color = _tail;
    canvas.drawCircle(p(61, 42), r(5.5), fill);

    // الجسم القطني (دوائر متداخلة)
    fill.color = _wool;
    canvas.drawCircle(p(40, 46), r(17), fill);
    canvas.drawCircle(p(25, 44), r(13), fill);
    canvas.drawCircle(p(55, 44), r(13), fill);
    canvas.drawCircle(p(40, 32), r(15), fill);
    canvas.drawCircle(p(30, 37), r(11), fill);
    canvas.drawCircle(p(50, 37), r(11), fill);

    // القرون (للذكور) — تُرسم خلف الرأس
    if (male) {
      final horn = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = r(3)
        ..strokeCap = StrokeCap.round
        ..color = _horn;
      final left = Path()
        ..moveTo(31 * s, 14 * s)
        ..quadraticBezierTo(22 * s, 4 * s, 27 * s, 0);
      final right = Path()
        ..moveTo(49 * s, 14 * s)
        ..quadraticBezierTo(58 * s, 4 * s, 53 * s, 0);
      canvas.drawPath(left, horn);
      canvas.drawPath(right, horn);
    }

    // الأذنان
    fill.color = _slate;
    _rotatedEllipse(canvas, fill, p(30.5, 17), r(4.5), r(3), -20);
    _rotatedEllipse(canvas, fill, p(49.5, 17), r(4.5), r(3), 20);

    // الرأس
    canvas.drawOval(
      Rect.fromCenter(center: p(40, 21), width: r(20), height: r(18)),
      fill,
    );

    // العين
    fill.color = _dark;
    canvas.drawCircle(p(36, 20), r(2), fill);
    fill.color = Colors.white;
    canvas.drawCircle(p(36.7, 19.3), r(0.8), fill);

    // الأنف (الفم)
    final mouth = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = r(1.2)
      ..strokeCap = StrokeCap.round
      ..color = _leg;
    final mp = Path()
      ..moveTo(38 * s, 26 * s)
      ..quadraticBezierTo(40 * s, 27.5 * s, 42 * s, 26 * s);
    canvas.drawPath(mp, mouth);
  }

  void _rotatedEllipse(Canvas c, Paint paint, Offset center, double rx,
      double ry, double deg) {
    c.save();
    c.translate(center.dx, center.dy);
    c.rotate(deg * 3.1415926535 / 180);
    c.drawOval(Rect.fromCenter(center: Offset.zero, width: rx * 2, height: ry * 2), paint);
    c.restore();
  }

  @override
  bool shouldRepaint(covariant _SheepPainter old) => old.male != male;
}