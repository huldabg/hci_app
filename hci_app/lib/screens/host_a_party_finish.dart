import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart'; // Husk å definere darkPurple, lightPurple, black, white

class HostPartyStatusScreen extends StatelessWidget {
  const HostPartyStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),

            // Toppic
            Text(
              "Host a Party",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: white,
              ),
            ),
            const SizedBox(height: 24),

            // Party code input felt
            Text(
              "Enter party code",
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
                hintText: "Enter code here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Number of participants
            Text(
              "X participants have joined the game",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: white,
              ),
            ),
            const Spacer(), 

            //Let's Begin button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print("Let's Begin pressed");
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: lightPurple,
                  foregroundColor: black,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 80, vertical: 24), //big button
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: Text("Let's Begin!"),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

