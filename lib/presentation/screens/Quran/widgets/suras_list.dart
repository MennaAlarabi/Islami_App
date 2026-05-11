import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/buisness_logic/quran/cubit/most_recently_cubit.dart';
import 'package:islami/presentation/screens/quran/model/quran_sura_model.dart';
import 'package:islami/presentation/screens/quran/widgets/sura_content.dart';

class SurasList extends StatelessWidget {
  static final List<int> tappedSura = [];
  final List<QuranSuraModel> suras;
  const SurasList({super.key, required this.suras});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final sura = suras[index];
        return ListTile(
          onTap: () async {
            tappedSura.remove(sura.index);
            tappedSura.insert(0, sura.index);
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SuraContent(index: sura.index + 1),
              ),
            );
            BlocProvider.of<MostRecentlyCubit>(
              context,
            ).getAllSuras();
          },
          leading: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset('assets/images/iconss/ic_sura.png'),
              Text(
                '${index + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          title: Text(
            sura.englishName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${sura.verses} Verses',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Text(
            sura.arabicName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) =>
          Divider(indent: 60.w, endIndent: 60.w),
      itemCount: suras.length,
    );
  }
}
