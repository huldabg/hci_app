import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';
import 'package:hci_app/screens/choose_avatar_buttons.dart';
import 'package:hci_app/screens/waiting_for_people_to_join.dart';

class SelectAvatarFillInScreen extends StatefulWidget {
  const SelectAvatarFillInScreen({super.key});

  @override
  State<SelectAvatarFillInScreen> createState() => _SelectAvatarFillInScreenState();
}

class _SelectAvatarFillInScreenState extends State<SelectAvatarFillInScreen> {
  String _selectedAvatarPath = "assets/icons/Logo.png"; // Default avatar

  void _selectAvatar() async {
    // Navigate to the avatar selection screen and wait for a result.
    final newAvatarPath = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseAvatarButtonsScreen()),
    );

    // If an avatar was selected (and not just navigated back from),
    // update the state to show the new avatar.
    if (newAvatarPath != null) {
      setState(() {
        _selectedAvatarPath = newAvatarPath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: darkPurple,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Text(
                  "Choose your avatar!",
                  style: TextStyle(color: white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: _selectAvatar,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(_selectedAvatarPath),
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.edit, color: Colors.white, size: 30),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: "Whats your favourite movie genre?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: "whats your favourite food?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: "where is your dream destination?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: "who is one person you admire?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: "what is an unpopular opinion you have?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => waitingScreen(participants: 2)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lightPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text("Continue", style: TextStyle(fontSize: 18, color: black)),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
