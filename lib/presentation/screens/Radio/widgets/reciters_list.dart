import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/buisness_logic/radio/cubit/reciters_cubit.dart';
import 'package:islami/constants/app_color.dart';

class RecitersList extends StatelessWidget {
  const RecitersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecitersCubit, RecitersState>(
      builder: (context, state) {
        if (state is RecitersLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColor.primaryColor),
          );
        } else if (state is RecitersLoaded) {
          return ListView.builder(
            itemCount: state.reciters.length,
            itemBuilder: (context, index) {
              return Container(
                height: 133.h,
                width: 390.w,
                margin: EdgeInsets.only(bottom: 10.h),
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
                        state.isPlaying && state.currentReciterIndex == index
                            ? 'assets/images/background/radio_playing.png'
                            : 'assets/images/background/radio_stop.png',
                      ),
                    ),
                    Positioned(
                      top: 15.h,
                      child: Column(
                        children: [
                          Text(
                            state.reciters[index].name,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              IconButton(
                                onPressed:
                                    state.isFirstSura &&
                                        state.currentReciterIndex == index
                                    ? null
                                    : () {
                                        context
                                            .read<RecitersCubit>()
                                            .previousSura();
                                      },
                                icon: Icon(
                                  Icons.skip_previous_rounded,
                                  size: 45,
                                ),
                                color: AppColor.secondryColor,
                                disabledColor: AppColor.secondryColor
                                    .withValues(alpha: 0.3),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<RecitersCubit>().toggleReciter(
                                    index,
                                  );
                                },
                                icon: Icon(
                                  state.isPlaying &&
                                          state.currentReciterIndex == index
                                      ? Icons.pause_rounded
                                      : Icons.play_arrow_rounded,
                                  size: 60,
                                  color: AppColor.secondryColor,
                                ),
                              ),
                              IconButton(
                                onPressed:
                                    state.isLastSura &&
                                        state.currentReciterIndex == index
                                    ? null
                                    : () {
                                        context
                                            .read<RecitersCubit>()
                                            .nextSura();
                                      },
                                icon: Icon(Icons.skip_next_rounded, size: 45),
                                color: AppColor.secondryColor,
                                disabledColor: AppColor.secondryColor
                                    .withValues(alpha: 0.3),
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
        } else if (state is RecitersFailed) {
          return SizedBox();
        }
        return SizedBox();
      },
    );
  }
}
