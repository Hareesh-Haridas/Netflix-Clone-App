import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Home/Widgets/custom_button_widget.dart';
import 'package:netflix/Models/movies.dart';
import 'package:netflix/Widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({super.key, required this.movie});
  final Movie movie;
  final DateFormat monthFormatter = DateFormat('MMM');
  final DateFormat dayFormatter = DateFormat('dd');
  final DateFormat dayFormatterDay = DateFormat('EEEE');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                monthFormatter
                    .format(DateTime.parse(movie.releaseDate))
                    .toLowerCase(),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kGreyColor),
              ),
              Text(
                dayFormatter.format(DateTime.parse(movie.releaseDate)),
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                image: movie.posterPath,
              ),
              Row(
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -2),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButton(
                        icon: Icons.notifications_none,
                        title: "Remind me",
                        iconSize: 20,
                        textsize: 12,
                      ),
                      kWidth,
                      CustomButton(
                        icon: Icons.info,
                        title: "Info",
                        iconSize: 20,
                        textsize: 12,
                      ),
                      kWidth,
                    ],
                  )
                ],
              ),
              kHeight,
              Text(
                  "Coming on ${dayFormatterDay.format(DateTime.parse(movie.releaseDate))}"),
              kHeight,
              Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Expanded(
                child: Text(
                  movie.overview,
                  style: const TextStyle(
                    color: kGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
