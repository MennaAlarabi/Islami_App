import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/features/core/app_color.dart';
import 'package:islami/features/model/hadeth_title_model.dart';

class HadethContent extends StatefulWidget {
  final int index;
  final String data;
  const HadethContent({
    super.key, 
    required this.index, 
    required this.data
  });

  // static final routName = 'hadethContent';

  @override
  State<HadethContent> createState() => _HadethContentState();
}

class _HadethContentState extends State<HadethContent> {
  late final String? hadethNumber;
  String? hadethData;

  @override
  void initState() {
    super.initState();
      readHadeth();
      hadethNumber = HadethTitleModel.hadeethNumberList[widget.index].title;
  }

  Future readHadeth() async {
    hadethData = widget.data;
    // hadethData = await rootBundle.loadString('assets/files/Hadeeth/h${widget.index + 1}.txt');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          HadethTitleModel.hadeethNumberList[widget.index].title,
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
              right: 60,
              left: 60,
            ),
            child: SingleChildScrollView(
              child: Text(
                textAlign: TextAlign.center,
                hadethData ?? '',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
