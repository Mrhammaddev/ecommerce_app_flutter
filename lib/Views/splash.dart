import 'dart:async';

import 'package:ecommerce_app_flutter/Views/on_boarding.dart';
import 'package:flutter/material.dart';
import '../Helpers/screen_transitions.dart';
import '../Utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(context, FadeRoute1(OnBoardingScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Images.SPLASH),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.colorBurn,
                  ))),
        ),
        Text(
          "Ecommerce App",
          style: Theme.of(context).textTheme.displaySmall!.merge(TextStyle()),
        )
      ],
    ));
  }
}
