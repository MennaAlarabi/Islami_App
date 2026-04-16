import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/constants/app_color.dart';
import 'package:islami/presentation/screens/hadeeth/model/hadeth_title_model.dart';

class HadethContent extends StatefulWidget {
  final int index;
  final String data;
  const HadethContent({super.key, required this.index, required this.data});

  @override
  State<HadethContent> createState() => _HadethContentState();
}

class _HadethContentState extends State<HadethContent> {
  late final String? hadethArTitel;
  late final String? hadethEnTitel;
  String? hadethData;

  @override
  void initState() {
    super.initState();
    readHadeth();
    hadethArTitel = HadethTitleModel.hadeethNumberList[widget.index].arabicTitle;
    hadethEnTitel = HadethTitleModel.hadeethNumberList[widget.index].englishTitle;
  }

  Future readHadeth() async {
    hadethData = widget.data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          hadethEnTitel!,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
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
              child: Column(
                children: [
                  Text(
                    hadethArTitel!,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    textAlign: TextAlign.center,
                    hadethData ?? '',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      height: 2.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
