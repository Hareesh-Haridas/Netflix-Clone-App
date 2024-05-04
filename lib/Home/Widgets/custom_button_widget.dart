import 'package:flutter/material.dart';
import 'package:netflix/Core/colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textsize = 18});
  final IconData icon;
  final String title;
  final double iconSize;
  final double textsize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textsize,
          ),
        ),
      ],
    );
  }
}
