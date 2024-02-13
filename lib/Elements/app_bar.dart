import 'package:ecommerce_app_flutter/Theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

simpleAppBarWidget(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    iconTheme: Theme.of(context).iconTheme,
    // systemOverlayStyle: SystemUiOverlayStyle(
    //   statusBarColor: Color.fromARGB(255, 17, 28, 60),
    //   statusBarIconBrightness: Brightness.light,
    //   statusBarBrightness: Brightness.dark,
    // ),
    centerTitle: true,
    title: Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline6!
          .merge(const TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,

    //this is only for dark/light mode check

    actions: [
      IconButton(
        onPressed: ThemeService().switchTheme,
        icon: Icon(FontAwesomeIcons.lightbulb),
      )
    ],

    // actions: [
    //   Padding(
    //     padding: EdgeInsets.all(8.0),
    //     child: DropdownButton(
    //       underline: SizedBox(),
    //       icon: Icon(
    //         Icons.language,
    //         color: Theme.of(context).primaryColor,
    //       ),
    //       onChanged: (LanguagesModel? language) {
    //         _changeLanguage(language!);
    //       },
    //       items: LanguagesModel.languageList()
    //           .map<DropdownMenuItem<LanguagesModel>>((lang) => DropdownMenuItem(
    //               value: lang,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 children: [Text(lang.flag!), Text(lang.name!)],
    //               )))
    //           .toList(),
    //     ),
    //   )
    // ],
  );
}
