import 'package:ecommerce_app_flutter/Elements/app_bar.dart';
import 'package:ecommerce_app_flutter/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBarWidget(context, ""),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome,",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  "Our Fashion App,",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        // keyboardType: TextInputType.emailAddress,
                        keyboardAppearance: Theme.of(context).brightness,
                        cursorColor: Theme.of(context).primaryColor,
                        // cursorHeight: 14,
                        cursorRadius: Radius.circular(50),
                        style: Theme.of(context).textTheme.headline6,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              FontAwesomeIcons.search,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            prefixIconColor: Theme.of(context).iconTheme.color,
                            filled: true,
                            contentPadding: EdgeInsets.all(14),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Search",
                            hintStyle: Theme.of(context).textTheme.labelSmall),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 50,
                      width: 50,
                      // padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle),
                      child: Image.asset(
                        CustomIcons.FILTER,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
