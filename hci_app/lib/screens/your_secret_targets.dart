import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';

class YourSecretTargets extends StatelessWidget {
  const YourSecretTargets({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste over personene (målene)
    final List<Map<String, String>> targets = [
      {"name": "Ron Wisley", "image": "assets/avatars/ron_wisley.png"},
      {"name": "Hermoine Granger", "image": "assets/avatars/hermoine_granger.png"},
      {"name": "Dumbledore", "image": "assets/avatars/dumbledore.png"},
      {"name": "Lucius Malfoy", "image": "assets/avatars/lucius_malfoy.png"},
      {"name": "Harry Potter", "image": "assets/avatars/harry_potter.png"},
    ];

    return Scaffold(
      backgroundColor: darkPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Timer and icon on the same row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/hour_glass.png",
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "XX:XX Left!",
                    style: TextStyle(
                      color: white,
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              Text(
                "Your secret targets are...?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
              const SizedBox(height: 20),

              //List with buttons
              Expanded(
                child: ListView.builder(
                  itemCount: targets.length,
                  itemBuilder: (context, index) {
                    return TargetButton(
                      name: targets[index]["name"]!,
                      imagePath: targets[index]["image"]!,
                    );
                  },
                ),
              ),

              //name and QR-code
              const SizedBox(height: 16),
              Text(
                "you are: Name Nameson",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                  "assets/icons/QR_code.png",
                  width: 120, 
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


class TargetButton extends StatelessWidget {
  final String name;
  final String imagePath;

  const TargetButton({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {
          print("pressed on $name");
         
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey[200],
                backgroundImage: AssetImage(imagePath),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}