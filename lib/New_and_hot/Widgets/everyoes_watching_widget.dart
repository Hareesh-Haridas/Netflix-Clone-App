import 'package:flutter/material.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Home/Widgets/custom_button_widget.dart';
import 'package:netflix/Models/movies.dart';
import 'package:netflix/Widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movie.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        Text(
          movie.overview,
          style: const TextStyle(
            color: kGreyColor,
          ),
        ),
        kheight50,
        VideoWidget(
          image: movie.posterPath,
        ),
        kHeight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.share,
              title: "Share",
              iconSize: 25,
              textsize: 16,
            ),
            kWidth,
            CustomButton(
              icon: Icons.add,
              title: "My list",
              iconSize: 25,
              textsize: 16,
            ),
            kWidth,
            CustomButton(
              icon: Icons.play_arrow,
              title: "play",
              iconSize: 25,
              textsize: 16,
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
