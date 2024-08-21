import 'package:ecommerce_app_flutter/Elements/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Elements/button_tab_bar.dart';
import '../../Utils/constants.dart';
import '../../Utils/images.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBarWidget(context, ""),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Order",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ButtonsTabBar(
                      backgroundColor: Theme.of(context).secondaryHeaderColor,
                      unselectedBackgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      unselectedLabelStyle: TextStyle(
                          color:
                              Theme.of(context).textTheme.displayLarge!.color),
                      unselectedBorderColor: Theme.of(context).focusColor,

                      borderWidth: 1,
                      // buttonMargin: EdgeInsets.symmetric(horizontal: 15),
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(
                          text: "Ongoing",
                        ),
                        Tab(
                          text: "Completed",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.separated(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 15),
                    itemBuilder: (context, index) {
                      return SizedBox(
                          height: 120,
                          width: kWidth(context),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.4),
                                    spreadRadius: 4,
                                    blurRadius: 22,
                                    offset: Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nike Shoes",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        Text(
                                          "Clean 90 Triple Sneakers",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "\$245.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
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
                                        color: Theme.of(context)
                                            .secondaryHeaderColor),
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
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 14,
                      );
                    },
                  ),
                  Center(
                    child: Icon(Icons.directions_transit),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
