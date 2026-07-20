import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/styles/app_colors.dart';
import 'app_field.dart';

/// قائمة منسدلة مع خيار "+ إضافة جديد" وإدخال نصي مضمّن.
/// fulعشان يكون خاص بالعملية الوحدة 
class CustomSelect extends StatefulWidget {
  final String label;
  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onAddCustom;

  const CustomSelect({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
    this.onAddCustom,
  });

  @override
  State<CustomSelect> createState() => _CustomSelectState();
}

class _CustomSelectState extends State<CustomSelect> {
  bool _showInput = false;
  final _ctrl = TextEditingController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppField(
      label: widget.label,
      child: _showInput ? _inputRow() : _dropdown(),
      //يا قائمة منسدلة يا وضع كتابه يدوي
    );
  }

  Widget _dropdown() {
    final items = [...widget.options];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.pageBg,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: widget.value.isEmpty ? null : widget.value,
          hint: const Text('اختر...'),
          items: [
            ...items.map((o) => DropdownMenuItem(value: o, child: Text(o))),
            if (widget.onAddCustom != null)
              const DropdownMenuItem(
                value: '__add',
                child: Text('+ إضافة جديد',
                    style: TextStyle(color: AppColors.primaryDark)),
              ),
          ],
          onChanged: (v) {
            if (v == '__add') {
              setState(() => _showInput = true);//
            } else if (v != null) {
              widget.onChanged(v);
            }
          },
        ),
      ),
    );
  }

  Widget _inputRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _ctrl,
            autofocus: true,
            decoration: appInputDecoration('اكتب هنا...'),
          ),
        ),
        SizedBox(width: 8.w),
        _sqBtn(Icons.check, AppColors.primaryDark, () {
          final t = _ctrl.text.trim();
          if (t.isNotEmpty) {
            widget.onAddCustom?.call(t);
            widget.onChanged(t);
          }
          setState(() => _showInput = false);
          _ctrl.clear();
        }),
        SizedBox(width: 6.w),
        _sqBtn(Icons.close, AppColors.border, () {
          setState(() => _showInput = false);
          _ctrl.clear();
        }, iconColor: AppColors.textMuted),
      ],
    );
  }

  Widget _sqBtn(IconData icon, Color bg, VoidCallback onTap,
      {Color iconColor = Colors.white}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, color: iconColor, size: 18.sp),
      ),
    );
  }
}