import 'package:get/get.dart';
import '../controllers/chess_controller.dart';

class GamesBinding extends Bindings {
  @override
  void dependencies() {
    /// Lazy injection — controller created only when needed
    Get.lazyPut<GamesController>(() => GamesController());
  }
}