// ignore_for_file: avoid_print, must_be_immutable

import 'package:ecommerce_app_flutter/Helpers/scroll_behaviour.dart';
import 'package:ecommerce_app_flutter/Views/Auth/login.dart';
import 'package:ecommerce_app_flutter/Views/landing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Helpers/screen_transitions.dart';
import '../Models/onbaording.dart';
import '../Utils/constants.dart';
import '../Utils/images.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: demoData.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnBoardContent(
                  title: demoData[index].title,
                  description: demoData[index].description,
                  image: demoData[index].image,
                ),
              ),
            ),
          ),
          // Indicator area
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      demoData.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: DotIndicator(
                          isActive: index == _pageIndex,
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (_pageIndex < 2) {
                        _pageIndex++;
                        _pageController.animateToPage(
                          _pageIndex,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeIn,
                        );
                      } else {
                        Navigator.pushReplacement(
                            context, FadeRoute1(LoginScreen()));
                      }
                    });
                  },
                  customBorder: const CircleBorder(),
                  child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                          shape: BoxShape.circle),
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Image.asset(
                          CustomIcons.ARROW_BACK,
                          height: 22,
                          width: 22,
                          color: context.theme.scaffoldBackgroundColor,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  String image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: RotatedBox(
            quarterTurns: 2,
            child: ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                width: kWidth(context) * 0.9,
                height: kWidth(context) * 0.9 * 1.53,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(
                    Images.SPLASH,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: context.theme.textTheme.headline5!
                  .merge(TextStyle(fontWeight: FontWeight.w900, fontSize: 26)),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19.0),
          child: Text(
            description,
            style: context.theme.textTheme.bodyText1!.merge(TextStyle()),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? context.theme.primaryColor : Colors.grey[400],
        // border: isActive ? null : Border.all(color: context.theme.primaryColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 40.0;

    var path = Path();

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(size.width - 10, roundnessFactor,
        size.width - roundnessFactor * 1.5, roundnessFactor * 1.3);
    path.lineTo(
        roundnessFactor * 0.6, size.height * 0.23 - roundnessFactor * 0.3);
    path.quadraticBezierTo(
        0, size.height * 0.23, 0, size.height * 0.23 + roundnessFactor);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
