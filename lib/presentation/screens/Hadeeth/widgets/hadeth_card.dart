import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/constants/app_color.dart';
import 'package:islami/presentation/screens/Hadeeth/model/hadeth_title_model.dart';

class HadethCard extends StatelessWidget {
  final String data;
  final int index;
  const HadethCard({
    super.key, 
    required this.data, 
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      width: 313.w,
      height: 618.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColor.primaryColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/background/bg_hadeth_card.png'),
          Image.asset('assets/images/background/hadeth_frame.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    HadethTitleModel.hadeethNumberList[index].title,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Text(
                    data,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.secondryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.8.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
