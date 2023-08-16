import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Theme/theme_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // primary: context.theme.buttonColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 16),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: ThemeService().switchTheme,
                  child: const Text('Change Theme')),
            ),
            Text(
              "Heading 4",
              style: context.theme.textTheme.headline4,
            ),
            Text(
              "Heading 5",
              style: context.theme.textTheme.headline5,
            ),
            Text(
              "Heading 6",
              style: context.theme.textTheme.headline6,
            ),
            Text(
              "headline medium",
              style: context.theme.textTheme.headlineMedium,
            ),
            Text(
              "headline small",
              style: context.theme.textTheme.headlineSmall,
            ),
            Text(
              "title large",
              style: context.theme.textTheme.titleLarge,
            ),
            Text(
              "title medium",
              style: context.theme.textTheme.titleMedium,
            ),
            Text(
              "title small",
              style: context.theme.textTheme.titleSmall,
            ),
            Text(
              "body large",
              style: context.theme.textTheme.bodyLarge,
            ),
            Text(
              "body medium",
              style: context.theme.textTheme.bodyMedium,
            ),
            Text(
              "body small",
              style: context.theme.textTheme.bodySmall,
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
