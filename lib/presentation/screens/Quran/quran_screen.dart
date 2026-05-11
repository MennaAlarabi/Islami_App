import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/buisness_logic/quran/cubit/most_recently_cubit.dart';
import 'package:islami/buisness_logic/quran/cubit/sura_search_cubit.dart';
import 'package:islami/buisness_logic/quran/cubit/sura_search_state.dart';
import 'package:islami/presentation/screens/quran/model/quran_sura_model.dart';
import 'package:islami/presentation/screens/quran/widgets/most_recently.dart';
import 'package:islami/presentation/screens/quran/widgets/sura_search.dart';
import 'package:islami/presentation/screens/quran/widgets/suras_list.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MostRecentlyCubit()..getAllSuras()),
        BlocProvider(create: (context) => SuraSearchCubit()),
      ],
      child: SizedBox(
        width: double.infinity.w,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 192.h),
              SuraSearch(),
              SizedBox(height: 20.h),
              BlocBuilder<SuraSearchCubit, SuraSearchState>(
                builder: (context, state) {
                  final suras = (state as SuraSearchLoaded).suras;
                  final isSearching =
                      suras.length !=
                      QuranSuraModel
                          .quranSuras
                          .length;
                  if (isSearching) {
                    return SizedBox();
                  }
                  return MostRecently();
                },
              ),
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
                child: BlocBuilder<SuraSearchCubit, SuraSearchState>(
                  builder: (context, state) {
                    final suras = (state as SuraSearchLoaded).suras;
                    return SurasList(suras: suras);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}