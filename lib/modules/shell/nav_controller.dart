import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// يتحكم بالتبويب الحالي + حالة المزامنة + عنوان الهيدر المشترك.
class NavController extends GetxController {
  final currentIndex = 0.obs;
  final pendingSync = 3.obs; // عدد العمليات بانتظار المزامنة
  final syncing = false.obs;

  static const titles = [
    'الرئيسية',
    'العمليات الميدانية',
    'إدارة الحلال',
    'المخزن والموردين',
  ];

  String get currentTitle => titles[currentIndex.value];

  // يُحسب مرة واحدة (بدل إعادة إنشاء DateFormat في كل بناء للهيدر)
  late final String todayStr =
      DateFormat('EEEE، d MMMM yyyy', 'ar').format(DateTime.now());

  void changeTab(int i) => currentIndex.value = i;

  Future<void> sync() async {
    if (syncing.value || pendingSync.value == 0) return;
    syncing.value = true;
    await Future.delayed(const Duration(milliseconds: 1800));
    syncing.value = false;
    pendingSync.value = 0;
  }
}