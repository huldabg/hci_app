import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';
import 'package:hci_app/screens/your_secret_targets.dart';

class waitingScreen extends StatefulWidget {
  final int participants; // Initial number of participants
  const waitingScreen({super.key, required this.participants});

  @override
  State<waitingScreen> createState() => _waitingScreenState();
}

class _waitingScreenState extends State<waitingScreen> {
  late int _currentParticipants;
  Timer? _animationTimer;

  @override
  void initState() {
    super.initState();
    _currentParticipants = widget.participants;

    // A repeating timer to create the counting animation.
    _animationTimer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_currentParticipants < 11) {
        // If we haven't reached the target number, increment the count.
        setState(() {
          _currentParticipants++;
        });
      } else {
        // Once we reach 11, cancel the timer and navigate.
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const YourSecretTargets(
              durationInSeconds: 60,
              numberOfQuestions: 5, 
              numberOfTargets: 5, // Default number of targets
            ),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationTimer?.cancel(); // Cancel the timer to avoid memory leaks.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: darkPurple,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center( // Center the content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  "Waiting for other people to join...",
                  textAlign: TextAlign.center, // Center text
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                ),
                const SizedBox(height: 24),

                // Logo image
                Image.asset(
                  "assets/icons/Logo.png",
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 24),

                 Text(
                  "$_currentParticipants people have joined the game",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: white,
                  ),
                ),
                const SizedBox(height: 40), // Add some bottom spacing
                CircularProgressIndicator(
                  color: lightPurple,
                ), // Show a loading spinner
              ],
            ),
          ),
        ),
      ),
    );
  }
}
