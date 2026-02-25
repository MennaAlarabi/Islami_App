import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/features/navigation_bar/tabs/quran_tab/widgets/most_recently.dart';
import 'package:islami/features/navigation_bar/tabs/quran_tab/widgets/sura_search.dart';
import 'package:islami/features/navigation_bar/tabs/quran_tab/widgets/suras_list.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 192.h),
            SuraSearch(),
            SizedBox(height: 20.h),
            MostRecently(),
            SizedBox(height: 10.h),
            Text(
              'Suras List',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: SurasList(
                onSuraTapped: () {
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}