import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/view/hoom_screen.dart';

import 'package:weather_app/widget/on_boarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static String routeName = 'OnboardingScreen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children: const [
              OnboardingPage(
                image: 'assets/g.jpg',
                description: 'Find the weather of your city',
              ),
              OnboardingPage(
                image: 'assets/p.jpg',
                description: 'Find the weather of your city',
              ),
            ],
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: Column(
                children: [
                  SmoothPageIndicator(
                      controller: pageController,
                      count: 2,
                      effect: const WormEffect(),
                      onDotClicked: (index) {}),
                  MaterialButton(
                    onPressed: () {
                  if(currentIndex == 1){
                    Navigator.pushReplacementNamed(context, HoomScreen.routeName);
                  }else{
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                        
                  }
                        
                  },
                  child:currentIndex==1? const Text('Get Started'):const  Text('Skip'),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
