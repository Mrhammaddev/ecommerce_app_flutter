// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  VoidCallback onTap;
  double? width;
  CustomButton({Key? key, required this.title, required this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          padding: EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
