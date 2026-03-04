import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/constants/app_color.dart';
import 'package:islami/presentation/screens/Quran/cubit/most_recently_cubit.dart';
import 'package:islami/presentation/screens/Quran/model/quran_sura_model.dart';
import 'package:islami/presentation/screens/Quran/widgets/sura_content.dart';
import 'package:islami/presentation/screens/Quran/widgets/suras_list.dart';

class MostRecently extends StatelessWidget {
  MostRecently({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostRecentlyCubit, MostRecentlyState>(
      builder: (context, state) {
        if (state is MostRecentlyLoaded) {
          if (state.tappedSuras.isEmpty) {
            return SizedBox(width: 150.w);
          }
          return Column(
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
                  itemCount: state.tappedSuras.length,
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
                          int suraIndex = state.tappedSuras[index];
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SuraContent(index: suraIndex + 1),
                            ),
                          );
                          BlocProvider.of<MostRecentlyCubit>(
                            context,
                          ).getAllSuras();
                        },
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  QuranSurahModel
                                      .quranSurahs[SurasList
                                          .tappedSura[index]]
                                      .englishName,
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff202020),
                                  ),
                                ),
                                Text(
                                  QuranSurahModel
                                      .quranSurahs[SurasList
                                          .tappedSura[index]]
                                      .arabicName,
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
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
