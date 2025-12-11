import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart'; // Husk å definere darkPurple, lightPurple, black, white

class HostPartyScreen extends StatelessWidget {
  const HostPartyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Overskrift
              Text(
                "Host a Party",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
              const SizedBox(height: 32),

              // Duration of the game
              Text(
                "Duration of the game (in minutes)",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: "Enter number of minutes",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Number of questions
              Text(
                "Number of questions in the game",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: "Enter number of questions",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Number of targets
              Text(
                "Number of targets in the game",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: "Enter number of targets",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Name
              Text(
                "Write in your name",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: "Name Nameson",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Enter Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print("Enter pressed");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: lightPurple,
                    foregroundColor: black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                  ),
                  child: Text(
                    "Enter",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
