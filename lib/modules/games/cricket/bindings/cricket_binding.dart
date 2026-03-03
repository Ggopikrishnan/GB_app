import 'package:get/get.dart';
import '../controllers/cricket_controller.dart';

class CricketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CricketController>(() => CricketController());
  }
}