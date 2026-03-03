import 'package:flutter/material.dart';
import '../../../../app/constants/app_colors.dart';

class MatchCard extends StatelessWidget {
  final String team1Name;
  final String team1Logo;
  final String team2Name;
  final String team2Logo;
  final String matchTime;
  final String matchDate;

  const MatchCard({
    super.key,
    required this.team1Name,
    required this.team1Logo,
    required this.team2Name,
    required this.team2Logo,
    required this.matchTime,
    required this.matchDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A32),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFF3A3A42),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: const [
                Expanded(
                  child: Center(
                    child: Text(
                      "Ongoing",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
                VerticalDivider(color: Colors.grey, width: 1),
                Expanded(
                  child: Center(
                    child: Text(
                      "Upcoming",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  gradient: RadialGradient(
    center: Alignment.center,
    radius: 0.4,
    colors: [
      Colors.white.withOpacity(0.08),
      const Color(0xFF1F1F27),
    ],
  ),
),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    matchDate,
                    style: const TextStyle(
                        color: AppColors.white, fontSize: 12),
                  ),
                ),

                const SizedBox(height: 20),

                /// Teams Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    /// Team 1
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            team1Logo,
                            height: 45,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          team1Name,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    /// Center Info
                    Column(
                      children: [
                        const Text(
                          "Match Starting In :",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          matchTime,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    /// Team 2
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            team2Logo,
                            height: 45,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          team2Name,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}