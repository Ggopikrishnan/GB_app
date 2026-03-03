import 'package:gb_app/modules/games/chess/service/chess_service.dart' show GameService;
import 'package:get/get.dart';

import '../model/chess_model.dart';

class GamesController extends GetxController {
  final GameService _gameService = GameService();
  final RxList<GameModel> games = <GameModel>[].obs;
  final RxList<GameModel> filteredGames = <GameModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxString selectedCategory = 'All'.obs;
  final RxString searchQuery = ''.obs;

  final List<String> categories = [
    'All',
    'mmorpg',
    'shooter',
    'strategy',
    'moba',
    'racing',
    'sports',
    'social',
    'fighting',
    'battle-royale',
  ];

  @override
  void onInit() {
    super.onInit();
    fetchGames();
  }

  Future<void> fetchGames() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final List<GameModel> result = await _gameService.fetchAllGames();
      games.assignAll(result);
      filteredGames.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> filterByCategory(String category) async {
    selectedCategory.value = category;
    searchQuery.value = '';

    if (category == 'All') {
      filteredGames.assignAll(games);
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final List<GameModel> result =
          await _gameService.fetchGamesByCategory(category);
      filteredGames.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading.value = false;
    }
  }

  void searchGames(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      filteredGames.assignAll(games);
      return;
    }

    final results = games
        .where(
          (game) => game.title.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    filteredGames.assignAll(results);
  }

  Future<void> refreshGames() async {
    selectedCategory.value = 'All';
    searchQuery.value = '';
    await fetchGames();
  }
}