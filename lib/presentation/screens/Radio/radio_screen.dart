import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/buisness_logic/radio/cubit/radio_cubit.dart';
import 'package:islami/constants/app_color.dart';
import 'package:islami/data/repository/radio/radio_repo.dart';
import 'package:islami/data/web_services/radio/radio_web_services.dart';
import 'package:islami/presentation/screens/radio/widgets/radio_list.dart';
import 'package:islami/presentation/screens/radio/widgets/reciters_list.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RadioCubit(RadioRepo(radioWebServices: RadioWebServices()))
            ..getRadios(),
      child: _RadioScreenContent(),
    );
  }
}

class _RadioScreenContent extends StatefulWidget {
  @override
  State<_RadioScreenContent> createState() => _RadioScreenContentState();
}

class _RadioScreenContentState extends State<_RadioScreenContent> {
  int selectedIndex = 0;
  final List<String> taps = ['Radio', 'Reciters'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 208.h),
        Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          decoration: BoxDecoration(
            color: const Color(0xFF1a1a1a),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: selectedIndex == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 0.5.w,
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              Row(
                children: List.generate(taps.length, (index) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: Container(
                        height: 44.h,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.black
                                : Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                          child: Text(taps[index]),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: selectedIndex == 0
                ? const RadioList()
                : const RecitersList(),
          ),
        ),
      ],
    );
  }
}
