import 'package:get/get.dart';

import '../controller/game_controller.dart' show GameController;

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController());
  }
}