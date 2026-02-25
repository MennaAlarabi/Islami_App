import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/features/model/quran_sura_model.dart';
import 'package:islami/features/navigation_bar/tabs/quran_tab/widgets/sura_content.dart';

class SurasList extends StatelessWidget {
  final VoidCallback? onSuraTapped;
  static final List<int> tappedSura = [];
  SurasList({super.key, this.onSuraTapped});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            tappedSura.remove(index);
            tappedSura.insert(0,index);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SuraContent(index: index + 1),
              ),
            );
            if(onSuraTapped != null) onSuraTapped!();
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
            '${QuranSurahModel.quranSurahs[index].englishName}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${QuranSurahModel.quranSurahs[index].verses} Verses',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Text(
            '${QuranSurahModel.quranSurahs[index].arabicName}',
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
      itemCount: 114,
    );
  }
}
