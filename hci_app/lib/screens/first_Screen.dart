import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';
import 'package:hci_app/screens/host_a_party.dart';
import 'package:hci_app/screens/select_avatar_fill_in.dart';

class CluePartyScreen extends StatelessWidget {
  const CluePartyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo image
              Image.asset(
                "assets/icons/Logo.png",
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 24),

              // Title
              Text(
                "CLUE PARTY",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
              const SizedBox(height: 24),

              // Enter party code label
              Text(
                "Write in the party code to join the party",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
              const SizedBox(height: 8),

              // Party code input field
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

              // Enter name label
              Text(
                "Write in your name",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
              const SizedBox(height: 8),

              // Name input field
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
              const SizedBox(height: 24),

              // Enter Button
              ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectAvatarFillInScreen()),
    );
  },
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), // oval button
    ),
    backgroundColor: lightPurple, // button color
    foregroundColor: black,        // tekstfarge
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min, 
    children: [
      Image.asset(
        "assets/icons/arrow.png",  
        width: 20,
        height: 20,
      ),
      const SizedBox(width: 8),      
      Text(
        "Enter",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 24),  //makes some space between the 2 buttons
              // Host a party instead Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HostPartyScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Oval size
                  ),
                  backgroundColor: lightPurple, // button color
                  foregroundColor: black, // text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12), // size
                ),
                child: Text(
                  "Host a party instead",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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


