import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/constants/app_color.dart';
import 'package:islami/presentation/screens/time/model/evening_azkar_model.dart';

class EveningAzkar extends StatefulWidget {
  const EveningAzkar({super.key});

  @override
  State<EveningAzkar> createState() => _EveningAzkarState();
}

class _EveningAzkarState extends State<EveningAzkar> {
  final azkar = EveningAzkarItem.eveningAzkar;
  late List<int> counters;

  @override
  void initState() {
    super.initState();
    counters = azkar.map((e) => e.count).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Evening Azkar',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: azkar.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      azkar[index].zekr,
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      counters[index]--;
                      if (counters[index] == 0) {
                        counters[index] = azkar[index].count;
                      }
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColor.secondryColor,
                        border: BoxBorder.all(
                          color: AppColor.primaryColor,
                          width: 2.w,
                        ),
                      ),
                      child: Text(
                        counters[index].toString(),
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
