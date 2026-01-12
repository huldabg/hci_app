import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';
import 'package:hci_app/screens/leaderboard.dart';

class TimeIsUpScreen extends StatefulWidget {
  const TimeIsUpScreen({super.key});

  @override
  State<TimeIsUpScreen> createState() => _TimeIsUpScreenState();
}

class _TimeIsUpScreenState extends State<TimeIsUpScreen> {
  @override
  void initState() {
    super.initState();
    // After a 3-second delay, navigate to the leaderboard.
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Leaderboard()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: darkPurple,
        body: Center(
          child: Text(
            "Time's Up!",
            style: TextStyle(
              color: white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
