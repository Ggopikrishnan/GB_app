import 'package:flutter/material.dart';
import 'package:gb_app/app/constants/app_colors.dart';
import 'package:gb_app/modules/games/chess/controllers/chess_controller.dart' show GamesController;
import 'package:get/get.dart';
import '../model/chess_model.dart';
import '../widgets/chess_card.dart' show GameCard;

class GamesScreen extends GetView<GamesController> {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          'Free Games',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: controller.refreshGames,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search games...',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: AppColors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: controller.searchGames,
            ),
          ),

          _CategoryChips(controller: controller),
          const SizedBox(height: 8),
          Expanded(child: _GamesBody(controller: controller)),
        ],
      ),
    );
  }
}

class _CategoryChips extends StatelessWidget {
  final GamesController controller;
  const _CategoryChips({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final String category = controller.categories[index];
          return Obx(() {
            final bool isSelected =
                controller.selectedCategory.value == category;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text(
                  category.toUpperCase(),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                selected: isSelected,
                onSelected: (_) => controller.filterByCategory(category),
                backgroundColor: AppColors.background,
                selectedColor: AppColors.background,
                checkmarkColor: Colors.white,
                side: BorderSide(
                  color: isSelected
                      ? const Color(0xFFE94560)
                      : Colors.transparent,
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

class _GamesBody extends StatelessWidget {
  final GamesController controller;
  const _GamesBody({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool loading = controller.isLoading.value;
      final String error = controller.errorMessage.value;
      final List<GameModel> games = controller.filteredGames;

      if (loading) {
        return const Center(
          child: CircularProgressIndicator(color: Color(0xFFE94560)),
        );
      }

      if (error.isNotEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.wifi_off, color: Colors.grey, size: 64),
              const SizedBox(height: 16),
              Text(
                error,
                style: const TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE94560),
                ),
                onPressed: controller.refreshGames,
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      }

      if (games.isEmpty) {
        return const Center(
          child: Text(
            'No games found',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        );
      }

      return RefreshIndicator(
        color: const Color(0xFFE94560),
        onRefresh: controller.refreshGames,
        child: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.85,
          ),
          itemCount: games.length,
          itemBuilder: (context, index) => GameCard(game: games[index]),
        ),
      );
    });
  }
}