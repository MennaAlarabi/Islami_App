import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/constants/app_color.dart';
import 'package:islami/presentation/screens/quran/model/quran_sura_model.dart';

class SuraContent extends StatefulWidget {
  final int index;
  const SuraContent({super.key, required this.index});

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  late final String? suraName;
  String? suraData;

  _SuraContentState();

  @override
  void initState() {
    super.initState();
    readSuraAyat(); // content
    suraName = QuranSuraModel.quranSuras[widget.index - 1].arabicName;
  }

  Future readSuraAyat() async {
    suraData = await rootBundle.loadString(
      'assets/files/Suras/${widget.index}.txt',
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          suraName!,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Image.asset(
            'assets/images/background/sura_frame.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 100,
              right: 20,
              left: 20,
            ),
            child: SingleChildScrollView(
              child: Text(
                textAlign: TextAlign.center,
                suraData ?? '',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  height: 2.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
