import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/features/core/app_color.dart';

class SuraSearch extends StatelessWidget {
  const SuraSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold
      ),
      cursorColor: Colors.white,
      
      decoration: InputDecoration(
        prefixIcon: Image.asset(
          'assets/images/iconss/ic_quran.png',
          color: AppColor.primaryColor,
        ),
        hintText: 'Sura Name',
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColor.primaryColor,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColor.primaryColor,
          )
        ),
      ),
    );
  }
}