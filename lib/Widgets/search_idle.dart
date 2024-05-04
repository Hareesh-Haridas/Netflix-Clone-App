import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Models/movies.dart';
import 'package:netflix/Search/widgets/future_builder_for_search.dart';
import 'package:netflix/Widgets/title_widget.dart';

// const imageUrl =
//     'https://www.themoviedb.org/t/p/w250_and_h141_face/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        searchTextTitle(
          title: "Top Searches",
        ),
        kHeight,
        Expanded(
          child: FutureBuilderForSearch(),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("$imagePath${movie.backDropPath}"),
            ),
          ),
        ),
        Expanded(
          child: Text(
            movie.title,
            style: const TextStyle(
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kWhiteColor,
            ),
          ),
        )
      ],
    );
  }
}
