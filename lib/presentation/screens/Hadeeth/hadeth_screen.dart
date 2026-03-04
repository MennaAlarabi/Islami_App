import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/presentation/screens/Hadeeth/widgets/hadeth_card.dart';
import 'package:islami/presentation/screens/Hadeeth/widgets/hadeth_content.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 214, bottom: 39),
      child: CarouselSlider.builder(
        itemCount: 50,
        itemBuilder: (context, index, realIndex) {
          return FutureBuilder<String>(
            future: rootBundle.loadString(
              'assets/files/Hadeeth/h${index + 1}.txt',
            ),
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HadethContent(
                        index: index, 
                        data: snapshot.data ?? ''
                      ),
                    ),
                  );
                },
                child: HadethCard(
                  data: snapshot.data ?? '',
                  index: index
                ),
              );
            },
          );
        },
        options: CarouselOptions(
          height: 550.h,
          viewportFraction: 300.w / MediaQuery.of(context).size.width,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
