import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/constants/app_color.dart';
import 'package:islami/presentation/screens/time/widgets/evening_azkar.dart';
import 'package:islami/presentation/screens/time/widgets/morning_azkar.dart';

class Azkar extends StatelessWidget {
  const Azkar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EveningAzkar()),
            );
          },
          child: Container(
            height: 259.h,
            width: 185.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColor.secondryColor,
              border: BoxBorder.all(color: AppColor.primaryColor, width: 2.w),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 24.h,
                  child: Image.asset(
                    'assets/images/iconss/ic_evening_azkar.png',
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  child: Text(
                    'Evening Azkar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 20.w),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MorningAzkar()),
            );
          },
          child: Container(
            height: 259.h,
            width: 185.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColor.secondryColor,
              border: BoxBorder.all(color: AppColor.primaryColor, width: 2.w),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 24.h,
                  child: Image.asset(
                    'assets/images/iconss/ic_morning_azkar.png',
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  child: Text(
                    'Morning Azkar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
