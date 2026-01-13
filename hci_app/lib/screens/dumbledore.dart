import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';
import 'package:hci_app/screens/time_is_up.dart';
import 'camera.dart';

// Custom Page Route for Fade-In Transition
class FadeInRoute extends PageRouteBuilder {
  final Widget page;
  FadeInRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        );
}

class DumbledoreScreen extends StatefulWidget {
  final int initialSeconds;
  final int numberOfQuestions;
  final String initialCode;

  const DumbledoreScreen({
    super.key,
    required this.initialSeconds,
    required this.numberOfQuestions,
    required this.initialCode,
  });

  @override
  State<DumbledoreScreen> createState() => _DumbledoreScreenState();
}

class _DumbledoreScreenState extends State<DumbledoreScreen> {
  late int _remainingSeconds;
  Timer? _timer;
  late final TextEditingController _codeController;

  final String allFacts = "Their favourite street food is chicken gyros\n\n"
      "Their favourite body of water is oceans\n\n"
      "They like to brag about their hair\n\n"
      "They secretly collect mini snow globes from every city they visit\n\n"
      "Their favourite midnight snack is grape-flavored popcorn";

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.initialSeconds;
    _codeController = TextEditingController(text: widget.initialCode);
    startTimer();
  }

  void _scanAndPasteCode() async {
    final scanResult = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const QrScannerScreen()),
    );

    if (mounted && scanResult != null) {
      setState(() {
        _codeController.text = scanResult;
      });
    }
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
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context, _codeController.text);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
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
                    _formatTime(_remainingSeconds),
                    style: TextStyle(
                      color: white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
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
                      backgroundImage:
                          AssetImage("assets/Avatars/dumbledore.png"),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dumbledore",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _getFacts(allFacts, widget.numberOfQuestions),
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
              Text(
                "Have you found your secret target?",
                style: TextStyle(
                  fontSize: 12,
                  color: white,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _codeController,
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
              ElevatedButton(
                onPressed: _scanAndPasteCode,
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
                child: const Text("Scan QR-code"),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
