import 'package:get/get.dart';
import '../controllers/protocols_controller.dart';

class ProtocolsBinding extends Bindings {
  @override
  void dependencies() {
    // put (لا lazyPut) كي تبقى حيّة عبر شاشات الإضافة/التفاصيل الفرعية
    Get.put(ProtocolsController());
  }
}
