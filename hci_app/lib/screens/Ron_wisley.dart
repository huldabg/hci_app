import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';
import 'package:hci_app/screens/time_is_up.dart';
import 'camera.dart';

// --- MAIN SCREEN ---
class FadeInRoute extends PageRouteBuilder {
  final Widget page;
  FadeInRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        );
}

class RonWisleyScreen extends StatefulWidget {
  final int initialSeconds;
  final int numberOfQuestions;
  const RonWisleyScreen({
    super.key,
    required this.initialSeconds,
    required this.numberOfQuestions,
  });

  @override
  State<RonWisleyScreen> createState() => _RonWisleyScreenState();
}

class _RonWisleyScreenState extends State<RonWisleyScreen> {
  late int _remainingSeconds;
  Timer? _timer;
  
  // Controller to automatically fill the TextField with the scanned code
  final TextEditingController _codeController = TextEditingController();

  final String allFacts = "Their favourite snack to eat during movies is "
      "caramel-dipped pretzels\n\n"
      "They always brag about their perfectly organized "
      "bookshelves\n\n"
      "Their favourite place to relax is a hammock\n\n"
      "They never leave the house without their blue lucky keychain\n\n"
      "They have an oddly strong fear of balloons popping nearby";

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.initialSeconds;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        if (mounted) {
          setState(() {
            _remainingSeconds--;
          });
        }
      } else {
        _timer?.cancel();
        if (mounted) {
          Navigator.of(context).pushReplacement(FadeInRoute(page: const TimeIsUpScreen()));
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _codeController.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor().toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds Left!';
  }

  String _getFacts(String allFacts, int numberOfFacts) {
    final factsList = allFacts.split('\n\n');
    final selectedFacts = factsList.take(numberOfFacts);
    return selectedFacts.join('\n\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/hour_glass.png", width: 32, height: 32),
                const SizedBox(width: 8),
                Text(
                  _formatTime(_remainingSeconds),
                  style: TextStyle(color: white, fontSize: 24),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage("assets/Avatars/ron_wisley.png"),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ron Wisley", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: black)),
                        const SizedBox(height: 8),
                        Text(_getFacts(allFacts, widget.numberOfQuestions), style: TextStyle(fontSize: 14, color: black)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text("Have you found your secret target?", style: TextStyle(fontSize: 12, color: white)),
            const SizedBox(height: 8),
            TextField(
              controller: _codeController, // Attached controller
              decoration: InputDecoration(
                filled: true,
                fillColor: white,
                hintText: "Enter code here",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                // Navigating to the Scanner and waiting for the result
                final String? result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QrScannerScreen()),
                );

                // If we got a result, put it in the text field
                if (result != null && mounted) {
                  setState(() {
                    _codeController.text = result;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: lightPurple,
                foregroundColor: black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              ),
              child: const Text("Scan QR-code"),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}