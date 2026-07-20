/// أسماء المسارات كثوابت (لا نصوص متناثرة).
abstract class Routes {
  static const login          = '/login';
  static const main           = '/main';

  // العمليات الميدانية
  static const weightOp       = '/op/weight';
  static const medicalOp      = '/op/medical';
  static const birthBreeding  = '/op/birth-breeding';
  static const deleteOp       = '/op/delete';
  static const editOp         = '/op/edit';
  static const addAnimal      = '/op/add-animal';

  // قائمة عامة حسب الحالة (مرضى / حوامل) + ملف الحيوان
  static const statusList     = '/status-list';
  static const animalProfile  = '/animal-profile';

  // المخزن
  static const medicineDetail = '/inventory/medicine';
  static const medicineAdd    = '/inventory/medicine-add';
  static const vendorDetail   = '/inventory/vendor';
  static const inventoryIndex = '/inventory/index';

  // شاشات فرعية
  static const protocols      = '/protocols';
  static const protocolAdd    = '/protocols/add';
  static const protocolDetail = '/protocols/detail';
  static const deletedStats   = '/stats/deleted';
  static const tradingStats   = '/stats/trading';
}