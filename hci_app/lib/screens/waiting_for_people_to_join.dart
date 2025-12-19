import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';

class waitingScreen extends StatelessWidget {
  final int participants; //variabel for number of participants
  const waitingScreen({super.key, required this.participants});


//needs this part in backend to tell the number of participants...
/*
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => WaitingScreen(participants: 5),
  ),
);*/

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


              // Title
              Text(
                "Waiting for other peoples to join...",
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
                "$participants have joined the game",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
              const SizedBox(height: 16),




                       ],
          ),
        ),
      ),
    );
  }
}
