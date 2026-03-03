import 'package:get/get.dart';
import '../controllers/rummy_controller.dart';

class RummyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RummyController>(() => RummyController());
  }
}