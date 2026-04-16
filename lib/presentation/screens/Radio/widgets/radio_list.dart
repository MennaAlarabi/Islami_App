import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/buisness_logic/radio/cubit/radio_cubit.dart';
import 'package:islami/constants/app_color.dart';

class RadioList extends StatelessWidget {
  const RadioList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        if (state is RadioLoadingState) {
          return Center(
            child: CircularProgressIndicator(color: AppColor.primaryColor),
          );
        } else if (state is RadioLoadedState) {
          return ListView.builder(
            itemCount: state.radios.length,
            itemBuilder: (context, index) {
              final isCurrent = state.currentUrl == state.radios[index].url;
              final isLoading = isCurrent && state.isLoading;
              return Container(
                height: 133.h,
                width: 390.w,
                margin: EdgeInsets.only(top: 10.h),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 35.h,
                      child: Image.asset(
                        isCurrent && !state.isLoading
                            ? 'assets/images/background/radio_playing.png'
                            : 'assets/images/background/radio_stop.png',
                      ),
                    ),
                    Positioned(
                      top: 15.h,
                      child: Column(
                        children: [
                          Text(
                            state.radios[index].name,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.read<RadioCubit>().toggleRadio(
                                    state.radios[index].url,
                                  );
                                },
                                icon: isLoading
                                    ? SizedBox(
                                        width: 30.w,
                                        height: 30.h,
                                        child: CircularProgressIndicator(
                                          color: AppColor.secondryColor,
                                          strokeWidth: 2.w,
                                        ),
                                      )
                                    : Icon(
                                        isCurrent && !state.isLoading
                                            ? Icons.pause_rounded
                                            : Icons.play_arrow_rounded,
                                        size: 60,
                                        color: AppColor.secondryColor,
                                      ),
                              ),
                              IconButton(
                                onPressed: isCurrent
                                    ? () {
                                        context.read<RadioCubit>().toggleMute();
                                      }
                                    : null,
                                icon: Icon(
                                  isCurrent && state.isMuted
                                      ? Icons.volume_off_rounded
                                      : Icons.volume_up_rounded,
                                  size: 40,
                                  color: isCurrent
                                      ? AppColor.secondryColor
                                      : AppColor.secondryColor.withValues(
                                          alpha: 0.3,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is RadioFailedState) {
          return SizedBox();
        }
        return SizedBox();
      },
    );
  }
}
