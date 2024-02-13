import 'package:ecommerce_app_flutter/Elements/custom_button.dart';
import 'package:ecommerce_app_flutter/Utils/constants.dart';
import 'package:ecommerce_app_flutter/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app_flutter/Theme/theme_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                      "Sign Up!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Text(
                    "Create a new account",
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
                      labelText: "User Name",
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
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyLarge,
                    cursorColor: Theme.of(context).primaryColor,
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
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
                title: "Sign Up",
                onTap: ThemeService().switchTheme,
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
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Already have an account? ",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                      // Get.to(() => SignUpScreen());
                    },
                    child: Text("Login",
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
