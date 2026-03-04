import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/constants/app_color.dart';
import 'package:islami/presentation/screens/Hadeeth/hadeth_screen.dart';
import 'package:islami/presentation/screens/Quran/quran_screen.dart';
import 'package:islami/presentation/screens/Radio/radio_screen.dart';
import 'package:islami/presentation/screens/Sebha/sebha_screen.dart';
import 'package:islami/presentation/screens/Time/time_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  // static final String routName = 'nav';

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
    int currentindex = 0;
    final List <String> backgrounds = [
      'assets/images/background/bg_quran.png',
      'assets/images/background/bg_hadeth.png',
      'assets/images/background/bg_sebha.png',
      'assets/images/background/bg_radio.png',
      'assets/images/background/bg_time.png',
    ];

    final List <Widget> pages = [
      QuranScreen(),
      HadethScreen(),
      SebhaScreen(),
      RadioScreen(),
      TimeScreen()
    ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgrounds[currentindex]),
          fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Positioned(
              top: 30.h,
              child: Image.asset('assets/images/onboarding/islami_top.png'),
            ),
            pages[currentindex]
          ]
        ),
      bottomNavigationBar: Container(
        height: 80.h,
        child: BottomNavigationBar(
          backgroundColor: AppColor.primaryColor,
          onTap: (value) {
            currentindex = value;
            setState(() {});
          },
          currentIndex: currentindex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,      
          items: [
            BottomNavigationBarItem(
              activeIcon: buildActiveNavIcon('assets/images/iconss/ic_quran.png'),
              icon: Image.asset('assets/images/iconss/ic_quran.png'),
              label: 'Quran'
            ),
            BottomNavigationBarItem(
              activeIcon: buildActiveNavIcon('assets/images/iconss/ic_hadeth.png'),
              icon: Image.asset('assets/images/iconss/ic_hadeth.png'),
              label: 'Hadith'
            ),
            BottomNavigationBarItem(
              activeIcon: buildActiveNavIcon('assets/images/iconss/ic_sebha.png'),
              icon: Image.asset('assets/images/iconss/ic_sebha.png'),
              label: 'Sebha'
            ),
            BottomNavigationBarItem(
              activeIcon: buildActiveNavIcon('assets/images/iconss/ic_radio.png'),
              icon: Image.asset('assets/images/iconss/ic_radio.png'),
              label: 'Radio'
            ),
            BottomNavigationBarItem(
              activeIcon: buildActiveNavIcon('assets/images/iconss/ic_time.png'),
              icon: Image.asset('assets/images/iconss/ic_time.png'),
              label: 'Time',
            ),
          ],
        ),
      ),
      ),
    );
  }
}

Container buildActiveNavIcon(String icon){
  return Container(
    width: 59.w,
    height: 34.h,
    decoration: BoxDecoration(
      color: Color(0xff202020).withOpacity(0.6),
      borderRadius: BorderRadius.circular(66)
    ),
    child: Image.asset(
      icon,
      color: Colors.white,
    ),
  );
}