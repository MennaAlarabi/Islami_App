import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/constants/app_color.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Time Tab',
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 30.sp, 
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}