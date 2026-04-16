import 'package:flutter/material.dart';
import 'package:islami/constants/app_color.dart';

class RecitersList extends StatelessWidget {
  const RecitersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Reciters',
        style: TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}