import 'package:get/get.dart';
import '../controllers/vendor_form_controller.dart';

class VendorFormBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => VendorFormController());
}
