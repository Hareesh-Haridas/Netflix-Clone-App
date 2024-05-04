import 'package:flutter/material.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Models/movies.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.movie});
  final Movie movie;
  @override
  build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("$imagePath${movie.posterPath}"),
        ),
      ),
    );
  }
}
