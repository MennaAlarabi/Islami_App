import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayTime extends StatelessWidget {
  const PrayTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 295.h,
      width: 390.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: Color(0xff856B3F),
      ),
      child: Stack(
        children: [
          Image.asset('assets/images/iconss/ic_pray_time.png'),
        ],
      ),
    );
  }
}
