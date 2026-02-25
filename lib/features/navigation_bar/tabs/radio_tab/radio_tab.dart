import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/features/core/app_color.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Radio Tab',
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