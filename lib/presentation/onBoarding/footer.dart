import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final String state;
  const Footer({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Text(
      state,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Color(0xFFE2BE7F)
        ),
    );
  }
}