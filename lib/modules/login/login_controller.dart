import 'package:get/get.dart';
import 'package:insighta/app_routes.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;

  void login() {
    Get.offAllNamed(Routes.main);
  }

  void continueAsGuest() => Get.offAllNamed(Routes.main);
}