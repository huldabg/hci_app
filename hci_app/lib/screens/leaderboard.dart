import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart'; 


//makes a function that calculates a score for the players
//needs to put the score on the leaderboard, maybe more backend?

/*int calculateScore ({
    required int correctAnswers,
    required int timeUsedSeconds,
}) {
  int baseScore = correctAnswers * 100 //100 points per correct answer
  int timePenalty = timeUsedSeconds/2  //-0.5 point per second used. maybe to much? vepends on how long the game lasts
  return baseScore-timePenalty; 
}*/

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // <-- gjør hele innholdet scrollbart
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              Text(
                "Leaderboard",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
              const SizedBox(height: 16),

              // big gold box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: gold,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage("assets/Avatars/harry_potter.png"),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Harry Potter",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // big silver box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: silver,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage("assets/Avatars/lucius_malfoy.png"),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Lucius Malfoy",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // big bronze box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: bronze,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage("assets/Avatars/ron_wisley.png"),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Ron Wisley",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 4th place
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage("assets/Avatars/dumbledore.png"),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Dumbledore",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 5th place
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage("assets/Avatars/hermoine_granger.png"),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Hermoine Granger",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // big button
              ElevatedButton(
                onPressed: () {
                  print("button pressed");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: lightPurple,
                  foregroundColor: black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 20,
                  ),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: Text("Return to main menu"),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
