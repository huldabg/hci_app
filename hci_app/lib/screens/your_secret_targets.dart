import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';
import 'package:hci_app/screens/Ron_wisley.dart';
import 'package:hci_app/screens/dumbledore.dart';
import 'package:hci_app/screens/harry_potter.dart';
import 'package:hci_app/screens/hermoine_granger.dart';
import 'package:hci_app/screens/lucius_malfoy.dart';
import 'package:hci_app/screens/time_is_up.dart';

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

class YourSecretTargets extends StatefulWidget {
  final int durationInSeconds;
  final int numberOfQuestions;
  final int numberOfTargets;
  const YourSecretTargets({
    super.key,
    required this.durationInSeconds,
    required this.numberOfQuestions,
    required this.numberOfTargets,
  });

  @override
  State<YourSecretTargets> createState() => _YourSecretTargetsState();
}

class _YourSecretTargetsState extends State<YourSecretTargets> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.durationInSeconds;
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
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor().toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds Left!';
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> allTargets = [
      {"name": "Ron Wisley", "image": "assets/Avatars/ron_wisley.png"},
      {"name": "Hermoine Granger", "image": "assets/Avatars/hermoine_granger.png"},
      {"name": "Dumbledore", "image": "assets/Avatars/dumbledore.png"},
      {"name": "Lucius Malfoy", "image": "assets/Avatars/lucius_malfoy.png"},
      {"name": "Harry Potter", "image": "assets/Avatars/harry_potter.png"},
    ];

    final selectedTargets = allTargets.take(widget.numberOfTargets).toList();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: darkPurple,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
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
                      _formatTime(_remainingSeconds),
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
                Expanded(
                  child: ListView.builder(
                    itemCount: selectedTargets.length,
                    itemBuilder: (context, index) {
                      return TargetButton(
                        name: selectedTargets[index]["name"]!,
                        imagePath: selectedTargets[index]["image"]!,
                        remainingSeconds: _remainingSeconds,
                        numberOfQuestions: widget.numberOfQuestions,
                      );
                    },
                  ),
                ),
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
      ),
    );
  }
}

class TargetButton extends StatelessWidget {
  final String name;
  final String imagePath;
  final int remainingSeconds;
  final int numberOfQuestions;

  const TargetButton({
    super.key,
    required this.name,
    required this.imagePath,
    required this.remainingSeconds,
    required this.numberOfQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {
          Widget destination;
          switch (name) {
            case 'Ron Wisley':
              destination = RonWisleyScreen(
                initialSeconds: remainingSeconds,
                numberOfQuestions: numberOfQuestions,
              );
              break;
            case 'Hermoine Granger':
              destination = HermoineGrangerScreen(
                initialSeconds: remainingSeconds,
                numberOfQuestions: numberOfQuestions,
              );
              break;
            case 'Dumbledore':
              destination = DumbledoreScreen(
                initialSeconds: remainingSeconds,
                numberOfQuestions: numberOfQuestions,
              );
              break;
            case 'Lucius Malfoy':
              destination = LuciusMalfoyScreen(
                initialSeconds: remainingSeconds,
                numberOfQuestions: numberOfQuestions,
              );
              break;
            case 'Harry Potter':
              destination = HarryPotterScreen(
                initialSeconds: remainingSeconds,
                numberOfQuestions: numberOfQuestions,
              );
              break;
            default:
              return; 
          }
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
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
