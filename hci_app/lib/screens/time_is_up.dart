import 'package:flutter/material.dart';
import 'package:hci_app/colors.dart';



class Time_Is_Up extends StatelessWidget {
  const Time_Is_Up({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPurple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),

Column(
                children: [

                  Text(
                    "Time is up!",
                    style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w400,
                    )
                ),

                const SizedBox(height: 120),    //more space between text and image

                            Text(
                    "The winner is...",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                    )
                ),

                const SizedBox(height: 24),  //more space between texst and image

        Image.asset(
                    "assets/icons/party_symbol.png",
                    width: 200,
                    height: 200,
                    )
                ],
            )
            ],
        ),
      ),
    );
  }
}