import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';

class RonWisleyScreen extends StatelessWidget {
  const RonWisleyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),

            //  Timer and icon on the same line
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/hour_glass.png",
                  width: 32,
                  height: 32,
                ),
                const SizedBox(width: 8),
                Text(
                  "XX:XX Left!",
                  style: TextStyle(
                    color: white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // big white box with name
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 28,
                    backgroundImage:
                        AssetImage("assets/Avatars/harry_potter.png"),
                  ),

                  const SizedBox(width: 12),

                  // Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Harry Potter",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: black,
                          ),
                        ),
                        const SizedBox(height: 8),

                        //fun facts. can also be moved out of the white box if you want? 
                        //but i think i looks cool inside the box.
                        Text(
                          "The hobby they`re most obsessed with isbuilding tiny model ships\n\n"
                          "Their favourite smell in the world is freshly baked sourdough bread\n\n"                         
                          "They belive every outfit looks better with a quirky hat\n\n"
                          "They once spent way too much money on a board game\n\n"
                          "They always talk about their dream of visiting the glowing caves of New Zealand\n\n",
                          style: TextStyle(
                            fontSize: 14,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Input label
            Text(
              "Have you found your secret target?",
              style: TextStyle(
                fontSize: 12,
                color: white,
              ),
            ),
            const SizedBox(height: 8),

            // Input field
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

            const Spacer(),

            // big button
            ElevatedButton(
              onPressed: () {
                print("Scan QR-code pressed");
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
              child: Text("Scan QR-code"),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
