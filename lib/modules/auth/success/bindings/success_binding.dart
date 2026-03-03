import 'package:gb_app/modules/auth/success/controller/success_controller.dart';
import 'package:get/get.dart';

class SuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessController());
  }
}