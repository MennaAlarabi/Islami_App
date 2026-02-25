import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {

  final String title;
  final String body;
  final String image;
  final double boxHeight;

  const OnboardingScreen({
    super.key,
    required this.image,
    required this.title,
    required this.body, 
    required this.boxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        const SizedBox(height: 150,),
        Image.asset(image),
        SizedBox(height: boxHeight,),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE2BE7F),
          ),
        ),
        SizedBox(height: 20),
        Text(
          body,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE2BE7F),
          ),
        ),
      ],
    );
  }
}