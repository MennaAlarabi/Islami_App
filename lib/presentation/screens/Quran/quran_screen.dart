import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/presentation/screens/Quran/manager/most_recently/cubit/most_recently_cubit.dart';
import 'package:islami/presentation/screens/Quran/manager/sura_search/cubit/sura_search_cubit.dart';
import 'package:islami/presentation/screens/Quran/model/quran_sura_model.dart';
import 'package:islami/presentation/screens/Quran/widgets/most_recently.dart';
import 'package:islami/presentation/screens/Quran/widgets/sura_search.dart';
import 'package:islami/presentation/screens/Quran/widgets/suras_list.dart';

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
              // * impact on sura list & most recently - rebuilding for sura list (BlocBuilder) depends on search text
              SuraSearch(),
              SizedBox(height: 20.h),
              /*
                 2 state ? searching : no searching
                 * Most Recently Appeares
                 ! no searching -> returned list from Cubit = quranSuras list (intilized in Model) "holding 114 elements"
                 * Most Recently doesn't appear
                 ? searching -> returned list from Cubit = filtered quranSuras relies on searchController "holding filtered elements"
              */
              BlocBuilder<SuraSearchCubit, SuraSearchState>(
                builder: (context, state) {
                  // * scope of UI Rebuilding
                  final suras = (state as SuraSearchLoaded).suras;
                  final isSearching =
                      suras.length !=
                      QuranSuraModel
                          .quranSuras
                          .length; // * true? -> searching - false? no searching
                  if (isSearching) {
                    return SizedBox(); // * Most Recently Disappeared
                  }
                  return MostRecently(); // * Most Recently Appeared
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
                // * UI Rebuilding relies on returned list of SuraSearchLoaded state
                child: BlocBuilder<SuraSearchCubit, SuraSearchState>(
                  builder: (context, state) {
                    // * scope of rebuilding
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
