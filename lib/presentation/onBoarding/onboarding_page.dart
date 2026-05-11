import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/presentation/nav_bar.dart';
import 'package:islami/presentation/onBoarding/footer.dart';
import 'package:islami/presentation/onBoarding/onboarding_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Color(0xff202020),
      globalHeader: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Image.asset(
          'assets/images/onboarding/islami_top.png',
          height: 150,
        ),
      ),

      pages: [
        PageViewModel(
          title: '',
          bodyWidget: OnboardingScreen(
            image: 'assets/images/onboarding/welcome.png',
            title: 'Welcome To Islami App',
            body: '',
            boxHeight: 50,
          ),
        ),
        PageViewModel(
          title: '',
          bodyWidget: OnboardingScreen(
            image: 'assets/images/onboarding/mosque.png',
            title: 'Welcome To Islami App',
            body: 'We Are Very Excited To Have You In Our Community',
            boxHeight: 30,
          ),
        ),
        PageViewModel(
          title: '',
          bodyWidget: OnboardingScreen(
            image: 'assets/images/onboarding/quraan.png',
            title: 'Reading the Quran',
            body: 'Read, and your Lord is the Most Generous',
            boxHeight: 30,
          ),
        ),
        PageViewModel(
          title: '',
          bodyWidget: OnboardingScreen(
            image: 'assets/images/onboarding/doaa.png',
            title: 'Bearish',
            body: 'Praise the name of your Lord, the Most High',
            boxHeight: 30,
          ),
        ),
        PageViewModel(
          title: '',
          bodyWidget: OnboardingScreen(
            image: 'assets/images/onboarding/radio.png',
            title: 'Holy Quran Radio',
            body:
                'You can listen to the Holy Quran Radio through the application for fee and easliy',
            boxHeight: 30,
          ),
        ),
      ],

      showBackButton: true,
      back: const Footer(state: 'Back'),
      next: const Footer(state: 'Next'),
      done: const Footer(state: 'Finish'),

      dotsDecorator: DotsDecorator(
        size: Size(10, 10),
        color: Color(0xff707070),
        activeSize: Size(16, 10),
        activeColor: Color(0xffFFD482),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),

      onDone: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => NavBar()),
          (route) => false,
        );
      },
    );
  }
}
