import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/features/core/app_color.dart';
import 'package:islami/features/model/quran_sura_model.dart';
import 'package:islami/features/navigation_bar/tabs/quran_tab/widgets/sura_content.dart';
import 'package:islami/features/navigation_bar/tabs/quran_tab/widgets/suras_list.dart';

class MostRecently extends StatefulWidget {
  final VoidCallback? onSuraTapped;
  const MostRecently({super.key, this.onSuraTapped});

  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
  @override
  Widget build(BuildContext context) {
    return SurasList.tappedSura.isEmpty
    ? SizedBox(width: 150.w,)
    : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most Recently',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: SurasList.tappedSura.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(
                  left: 17.w,
                  right: 6.w,
                  bottom: 7.h,
                  top: 7.h,
                ),
                width: 283.w,
                height: 150.h,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: GestureDetector(
                  onTap: () async {
                    int suraIndex = SurasList.tappedSura[index];
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SuraContent(index: suraIndex + 1
                            ),
                      ),
                    );
                    if(widget.onSuraTapped != null) widget.onSuraTapped!();
                  },
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${QuranSurahModel.quranSurahs[SurasList.tappedSura[index]].englishName}',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff202020),
                            ),
                          ),
                          Text(
                            '${QuranSurahModel.quranSurahs[SurasList.tappedSura[index]].arabicName}',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff202020),
                            ),
                          ),
                          Text(
                            '${QuranSurahModel.quranSurahs[SurasList.tappedSura[index]].verses} Verses',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff202020),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/images/iconss/ic_most_recently.png',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
