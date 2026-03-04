import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/constants/app_color.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  List<String> zekr = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 26.w, right: 26.w),
        child: Column(
          children: [
            SizedBox(height: 217.h),
            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {
                counter++;
                if (counter == 31) {
                  counter = 0;
                  if (index == 2) {
                    index = 0;
                  } else
                    index++;
                }
                setState(() {});
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/background/sebha_frame.png'),
                  Column(
                    children: [
                      SizedBox(height: 100.h),
                      Text(
                        zekr[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        counter.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
