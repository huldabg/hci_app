import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';

class ChooseAvatar extends StatelessWidget {
  const ChooseAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16),

              Text(
                "Select an Avatar",
                style: TextStyle(
                  color: white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ), //text at the top of the page
              ),

              const SizedBox(height: 32),

              Expanded(
                child: GridView.count(   //uses grid function to make a grid of buttons
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  children: [
                    _avatarButton("assets/Avatars/lucius_malfoy.png"),
                    _avatarButton("assets/Avatars/dumbledore.png"),
                    _avatarButton("assets/Avatars/harry_potter.png"),
                    _avatarButton("assets/Avatars/hermoine_granger.png"),
                    _avatarButton("assets/Avatars/me.png"),
                    _avatarButton("assets/Avatars/ron_wisley.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarButton(String assetPath) {
  return GestureDetector(
    onTap: () {
      debugPrint("Avatar tapped: $assetPath"); //when button is pressed, the terminal tells you:)
    },
    child: Center(
      child: CircleAvatar(
        radius: 70,
        backgroundImage: AssetImage(assetPath),
      ),
    ),
  );
}
}
