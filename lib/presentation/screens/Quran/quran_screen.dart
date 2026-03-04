import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/presentation/screens/Quran/cubit/most_recently_cubit.dart';
import 'package:islami/presentation/screens/Quran/widgets/most_recently.dart';
import 'package:islami/presentation/screens/Quran/widgets/sura_search.dart';
import 'package:islami/presentation/screens/Quran/widgets/suras_list.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MostRecentlyCubit()..getAllSuras(),
      child: Container(
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
              Expanded(child: SurasList()),
            ],
          ),
        ),
      ),
    );
  }
}
