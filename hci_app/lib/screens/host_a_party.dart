import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';
import 'package:hci_app/screens/host_a_party_finish.dart';

class HostPartyScreen extends StatefulWidget {
  const HostPartyScreen({super.key});

  @override
  State<HostPartyScreen> createState() => _HostPartyScreenState();
}

class _HostPartyScreenState extends State<HostPartyScreen> {
  final _durationController = TextEditingController();
  final _questionsController = TextEditingController();
  final _targetsController = TextEditingController();

  @override
  void dispose() {
    _durationController.dispose();
    _questionsController.dispose();
    _targetsController.dispose();
    super.dispose();
  }

  void _startGame() {
    // Parse duration
    double minutes = double.tryParse(_durationController.text) ?? 1.0;
    minutes = max(0.1, min(minutes, 5.0));
    final durationInSeconds = (minutes * 60).round();

    // Parse number of questions
    int numberOfQuestions = int.tryParse(_questionsController.text) ?? 5;
    numberOfQuestions = max(2, min(numberOfQuestions, 5));

    // Parse number of targets
    int numberOfTargetsInput = int.tryParse(_targetsController.text) ?? 5;
    numberOfTargetsInput = max(4, numberOfTargetsInput);

    int finalNumberOfTargets;
    if (numberOfTargetsInput == 4) {
      finalNumberOfTargets = 3;
    } else if (numberOfTargetsInput == 5) {
      finalNumberOfTargets = 4;
    } else { // 6 or more
      finalNumberOfTargets = 5;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostPartyStatusScreen(
          durationInSeconds: durationInSeconds,
          numberOfQuestions: numberOfQuestions,
          numberOfTargets: finalNumberOfTargets,
        ),
      ),
    );
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  "Host a Party",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  "Duration of the game (in minutes)",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: white,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _durationController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: "Enter minutes (0.1 to 5), defaults to 1",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Number of questions in the game",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: white,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _questionsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: "Enter questions (2 to 5), defaults to 5",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Number of targets in the game",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: white,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _targetsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: "Enter targets (min 4), defaults to 5",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Write in your name",
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
                    hintText: "Name Nameson",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: _startGame,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: lightPurple,
                      foregroundColor: black,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    ),
                    child: Text(
                      "Enter",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
