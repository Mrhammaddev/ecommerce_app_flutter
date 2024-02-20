// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app_flutter/Elements/app_bar.dart';
import 'package:ecommerce_app_flutter/Theme/theme_service.dart';
import 'package:ecommerce_app_flutter/Utils/constants.dart';
import 'package:ecommerce_app_flutter/Utils/data.dart';
import 'package:ecommerce_app_flutter/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBarWidget(context, ""),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome,",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Our Fashion App",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            // keyboardType: TextInputType.emailAddress,
                            keyboardAppearance: Theme.of(context).brightness,
                            cursorColor: Theme.of(context).primaryColor,
                            cursorHeight: 16,
                            cursorRadius: const Radius.circular(50),
                            style: Theme.of(context).textTheme.bodyLarge,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.search,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                prefixIconColor:
                                    Theme.of(context).iconTheme.color,
                                filled: true,
                                fillColor:
                                    ThemeService().box.read("isThemeMode") ==
                                            true
                                        ? Theme.of(context).secondaryHeaderColor
                                        : const Color(0xffF3F4F5),
                                contentPadding: const EdgeInsets.all(14),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Search...",
                                hintStyle:
                                    Theme.of(context).textTheme.labelSmall),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          height: 55,
                          width: 55,
                          // clipBehavior: Clip.antiAliasWithSaveLayer,
                          padding: const EdgeInsets.all(14.5),
                          decoration: BoxDecoration(
                            color: Theme.of(context).secondaryHeaderColor,
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   image: AssetImage(CustomIcons.FILTER),
                            // ),
                          ),
                          child: Image.asset(
                            CustomIcons.FILTER,
                            height: 18,
                            width: 18,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: kWidth(context) / 1.4,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Theme.of(context).cardColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28)),
                          margin: const EdgeInsets.only(right: 12, left: 20),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                  right: -80,
                                  child: Image.asset(
                                    Images.BAG,
                                    fit: BoxFit.cover,
                                    height: 170,
                                  )),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "50% Off",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                      Text(
                                        "On everything tody",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        "Code: MALIKDEV",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                      SizedBox(
                                        // width: 90,
                                        height: 27,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(context)
                                                .secondaryHeaderColor,
                                            // padding: EdgeInsets.symmetric(
                                            // vertical: 0, horizontal: 10),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          child: Text(
                                            "Get Now",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall!
                                                .merge(TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: StaggeredGrid.count(
                      crossAxisCount: 1,
                      axisDirection: AxisDirection.right,
                      children: List.generate(
                        categoriesName.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     RightToLeftTransition(
                                //         CategoryCoursesScreen(
                                //       category: categoriesList[index],
                                //     )));
                              },
                              child: Card(
                                color: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: BorderSide(
                                        color: Theme.of(context).focusColor)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      categoriesName[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .merge(
                                            TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: SizedBox(
                    height: 180,
                    width: kWidth(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 12),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Theme.of(context).focusColor.withOpacity(0.5),
                              spreadRadius: 8,
                              blurRadius: 22,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: kHeight(context),
                              width: kWidth(context) / 4.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  image: DecorationImage(
                                      image: AssetImage(Images.SHOE5),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nike Shoes",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Text(
                                    "Clean 90 Triple Sneakers",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "\$245.00",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 33,
                              width: 33,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 17,
                                color: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .color,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "New Arrivals",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "View All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: shoes4.length,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 200,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              width: kWidth(context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Image.asset(
                                shoes4[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 15,
                              top: 15,
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                                child: Icon(
                                  FontAwesomeIcons.heart,
                                  size: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Nike Shoes",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          "Clean 90 Triple Sneakers",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          "\$789.00",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    );
                  }),
              SizedBox(
                height: 40,
              )
            ]),
      ),
    );
  }
}
