import 'package:flutter/material.dart';

class Ron_wisley extends StatelessWidget {
  const Ron_wisley({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // hvis du ikke vil ha AppBar, fjern denne linjen
      appBar: AppBar(title: Text("Home")),

      body: Center(
        child: ScreenContent(), // <- her legges Figma-layouten
      ),
    );
  }
}

class ScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412,
      height: 917,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF625B71),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 23,
            top: 294,
            child: SizedBox(
              width: 371,
              height: 370,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Their favourite street food is\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
