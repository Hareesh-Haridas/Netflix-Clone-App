import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Home/Widgets/custom_button_widget.dart';
import 'package:tmdb_api/tmdb_api.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imagePath + image), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButton(
                  title: "My List",
                  icon: Icons.add,
                ),
                _PlayButton(),
                const CustomButton(icon: Icons.info, title: "Info")
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kWhiteColor),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Text(
          "Play",
          style: TextStyle(
            fontSize: 20,
            color: kBlackColor,
          ),
        ),
      ),
    );
  }
}
