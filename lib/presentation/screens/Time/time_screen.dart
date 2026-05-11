import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/buisness_logic/time/cubit/pray_time_cubit.dart';
import 'package:islami/data/repository/time/pray_repo.dart';
import 'package:islami/data/web_services/time/pray_web_services.dart';
import 'package:islami/presentation/screens/time/widgets/azkar.dart';
import 'package:islami/presentation/screens/time/widgets/pray_time.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PrayTimeCubit(PrayRepo(prayWebServices: PrayWebServices()))
            ..getPrayTime(),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          children: [
            SizedBox(height: 201.h),
            PrayTime(),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Azkar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Azkar(),
          ],
        ),
      ),
    );
  }
}
