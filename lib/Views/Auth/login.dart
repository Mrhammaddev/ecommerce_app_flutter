import 'dart:developer';

import 'package:ecommerce_app_flutter/Elements/custom_button.dart';
import 'package:ecommerce_app_flutter/Utils/constants.dart';
import 'package:ecommerce_app_flutter/Utils/images.dart';
import 'package:ecommerce_app_flutter/Views/Auth/signup.dart';
import 'package:ecommerce_app_flutter/Views/landing.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app_flutter/Theme/theme_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // log(ThemeService().box.read('isThemeMode').toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: kHeight(context) / 8,
              ),
              Image.asset(
                ThemeService().box.read('isThemeMode') == true
                    ? CustomIcons.LOGO_DARK
                    : CustomIcons.LOGO_LIGHT,
                // height: kHeight(context) / 5,
                width: kWidth(context) / 2,
              ),
              SizedBox(
                height: kHeight(context) / 18,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Text(
                    "Please login or signup to continue",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              SizedBox(
                height: kHeight(context) / 20,
              ),
              Column(
                children: [
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyLarge,
                    cursorColor: Theme.of(context).primaryColor,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: Theme.of(context).textTheme.titleSmall,

                      // border: UnderlineInputBorder(
                      //   borderSide: BorderSide(
                      //       color: Theme.of(context).secondaryHeaderColor),
                      // ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).focusColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).focusColor),
                      ),
                    ),
                  ),
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyLarge,
                    cursorColor: Theme.of(context).primaryColor,
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: Theme.of(context).textTheme.titleSmall,

                      // border: UnderlineInputBorder(
                      //   borderSide: BorderSide(
                      //       color: Theme.of(context).secondaryHeaderColor),
                      // ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).focusColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).focusColor),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: kHeight(context) / 16,
              ),
              CustomButton(
                title: "Login",
                onTap: () {
                  Get.to(() => LandingScreen());
                },
                width: kWidth(context),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                          thickness: 1.2, color: Theme.of(context).focusColor)),
                  SizedBox(width: 14),
                  Text("or"),
                  SizedBox(width: 14),
                  Expanded(
                      child: Divider(
                          thickness: 1.2, color: Theme.of(context).focusColor)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    width: kWidth(context),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff316FF6),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.facebook),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Continue with Facebook",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    width: kWidth(context),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Theme.of(context).focusColor),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.google,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Continue with Google",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    width: kWidth(context),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Theme.of(context).focusColor),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.apple,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Continue with Apple",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => SignupScreen());
                    },
                    child: Text("Sign Up",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
