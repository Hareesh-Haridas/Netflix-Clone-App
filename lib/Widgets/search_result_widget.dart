import 'package:flutter/material.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Models/movies.dart';
import 'package:netflix/Widgets/title_widget.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/mGR5OVq4edV7zMicFRdBAWyeCeu.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required this.result});
  final String result;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const searchTextTitle(title: "Movies & TV"),
        kHeight,
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: searchResultListNotifeir,
            builder: (context, value, _) {
              if (value.isNotEmpty) {
                return GridView.builder(
                    itemCount: value.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1 / 1.5),
                    itemBuilder: (context, index) {
                      var data = value[index];
                      return MainCard(
                        movie: data,
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          // image: NetworkImage(imageUrl),
          image: NetworkImage("$imagePath${movie.posterPath}"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
