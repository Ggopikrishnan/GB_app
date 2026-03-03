import 'package:gb_app/modules/home/models/game_model.dart';
import 'package:get/get.dart';


class GameController extends GetxController {

  final games = <GameModel>[
    GameModel(image: "assets/images/b1.png", title: "Game 01"),
    GameModel(image: "assets/images/b2.jpg", title: "Game 02"),
    GameModel(image: "assets/images/b3.png", title: "Game 03"),
    GameModel(image: "assets/images/b4.png", title: "Game 04"),
    GameModel(image: "assets/images/b5.png", title: "Game 05"),
    GameModel(image: "assets/images/b6.png", title: "Game 06"),
    GameModel(image: "assets/images/b7.png", title: "Game 07"),
    GameModel(image: "assets/images/b8.png", title: "Game 08"),
  ].obs;

}