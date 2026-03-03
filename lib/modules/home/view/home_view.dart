import 'package:flutter/material.dart';
import 'package:gb_app/modules/home/widgets/game_card.dart';
import 'package:get/get.dart';
import '../../../../app/constants/app_colors.dart';
import '../controller/home_controller.dart';
import '../widgets/app_drawer.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/banner_widget.dart';
import '../widgets/bottom_nav_widget.dart';
import '../widgets/category_item.dart';
import '../widgets/game_grid_view.dart';
import '../widgets/section_title.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const AppDrawer(),
      bottomNavigationBar: const BottomNavWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildHeader(context),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Welcome to\nGamerz Bank",
                    style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: AppColors.gold,
                      height: 1.2,
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromRGBO(255, 255, 255, 0.1),
                      border: Border.all(
                        color: Color.fromRGBO(255, 255, 255, 0.1),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/splash.png",
                        width: 70,
                        height: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                "One wallet. Endless wins.",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "100% Secure and Trusted Platform...",
                style: TextStyle(fontSize: 10, color: AppColors.grey),
              ),

              const SizedBox(height: 30),
              SizedBox(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final item = controller.categories[index];
                    return CategoryItem(
                      title: item["title"]!,
                      image: item["image"]!,
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),
              const BannerCarousel(),

              const SizedBox(height: 30),
              const Center(child: SectionTitle(title: "Enter the World of GB")),
              const SizedBox(height: 15),

              const BannerWidget(imagePath: "assets/images/d9.png"),
              const SizedBox(height: 15),
              const BannerWidget(imagePath: "assets/images/d11.jpg"),

              const SizedBox(height: 30),
              const Center(child: SectionTitle(title: "Fantasy Sports")),
              const SizedBox(height: 6),

              const Center(
                child: Text(
                  "Build your team. Play smart. Win real rewards",
                  style: TextStyle(fontSize: 14, color: AppColors.grey),
                ),
              ),

              const SizedBox(height: 20),
              MatchCard(
                team1Name: "MI",
                team1Logo: "assets/images/mi.jpg",
                team2Name: "CSK",
                team2Logo: "assets/images/csk.png",
                matchTime: "08h : 38m",
                matchDate: "Monday, 15 Dec",
              ),

              const SizedBox(height: 30),
              const Center(child: SectionTitle(title: "Game Center")),
              const SizedBox(height: 6),

              const Center(
                child: Text(
                  "Manage everything you need, right here.",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  final containerTexts = [
                    'Leader\nboard',
                    'Wallet',
                    'Game\nhistory',
                    'Levels',
                  ];

                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: index == 3 ? 0 : 12),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.gold,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            containerTexts[index],
                            style: const TextStyle(
                              color: AppColors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1F27),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                alignment: Alignment.center,
                child: const SectionTitle(title: "Promotional Space"),
              ),

              const SizedBox(height: 30),
              const Center(
                child: SectionTitle(title: "Pure Luck - Instant results."),
              ),
              const SizedBox(height: 6),

              const Center(
                child: Text(
                  "No strategy. Just spin and see",
                  style: TextStyle(fontSize: 14, color: AppColors.grey),
                ),
              ),

              const SizedBox(height: 20),
              const GameGridView(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: AppColors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
             Image.asset(
               "assets/images/Avatar Photo.png",
               width: 33, 
               height: 32,
               fit: BoxFit.contain,
             ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(color: AppColors.white, fontSize: 12),
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return CircularProgressIndicator();
                  }
                  return Text(
                    controller.userName.value,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/leading icon.png",
                width: 18, 
                height: 18,
                fit: BoxFit.contain,
                color: Colors.white, 
              ),
              SizedBox(width: 6),
              Text(
                "₹200",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 6),
              Image.asset(
                "assets/images/trailing icon.png",
                width: 18, 
                height: 18,
                fit: BoxFit.contain,
                color: Colors.white, 
              ),
            ],
          ),
        ),
      ],
    );
  }
}
