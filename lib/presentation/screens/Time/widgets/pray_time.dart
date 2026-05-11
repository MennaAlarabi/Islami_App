import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/buisness_logic/time/cubit/pray_time_cubit.dart';
import 'package:islami/constants/app_color.dart';

class PrayTime extends StatelessWidget {
  const PrayTime({super.key});

  int getCurrentPrayerIndex(Map<String, String> prayers) {
    final now = TimeOfDay.now();
    final currentMinutes = now.hour * 60 + now.minute;

    final entries = prayers.entries.toList();

    for (int i = entries.length - 1; i >= 0; i--) {
      final parts = entries[i].value.split(':');
      final prayerMinutes = int.parse(parts[0]) * 60 + int.parse(parts[1]);

      if (currentMinutes >= prayerMinutes) {
        return i;
      }
    }

    return 0; 
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayTimeCubit, PrayTimeState>(
      builder: (context, state) {
        if (state is PrayTimeLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColor.primaryColor),
          );
        } else if (state is PrayTimeLoaded) {
          final parts = state.prayer.date.readable.split(' ');
          final initialIndex = getCurrentPrayerIndex(state.prayer.timings.prayers);
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
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            "${parts[0]} ${parts[1]}\n${parts[2]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),

                          Spacer(),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Pray Time",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: Color(
                                    0xff202020,
                                  ).withValues(alpha: 0.7),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                state.prayer.date.gregorian.weekday,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: Color(
                                    0xff202020,
                                  ).withValues(alpha: 0.9),
                                ),
                              ),
                            ],
                          ),

                          Spacer(),

                          SizedBox(
                            width: 90.w,
                            child: Text(
                              "${state.prayer.date.hijri.day} "
                              "${state.prayer.date.hijri.monthEn}\n"
                              "${state.prayer.date.hijri.year}",
                              textAlign: TextAlign.end,
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.white,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: CarouselSlider.builder(
                          itemCount: state.prayer.timings.prayers.length,
                          itemBuilder: (context, index, realIndex) {

                            final entry = state.prayer.timings.prayers.entries.elementAt(index);

                            return Container(
                              height: 140.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColor.secondryColor,
                                    const Color.fromARGB(255, 193, 163, 111),
                                  ],
                                  stops: [0.1, 1.0],
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(height: 30.h),
                                    Text(
                                      entry.key,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      entry.value,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            height: 140.h,
                            viewportFraction:
                                150.w / MediaQuery.of(context).size.width,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.horizontal,
                            enlargeCenterPage: true,
                            initialPage: initialIndex,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is PrayTimeFailed) {
          return SizedBox();
        }
        return SizedBox();
      },
    );
  }
}
