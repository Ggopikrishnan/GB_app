import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/game_controller.dart';
import 'game_item.dart';

class GameGridView extends StatelessWidget {
  const GameGridView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<GameController>();

    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.games.length,
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 per row
          mainAxisSpacing: 20,
          crossAxisSpacing: 12,
          childAspectRatio: 0.70, // slightly better proportion
        ),
        itemBuilder: (context, index) {
          final game = controller.games[index];

          return GameItemCard(
            image: game.image,
            title: game.title,
          );
        },
      ),
    );
  }
}