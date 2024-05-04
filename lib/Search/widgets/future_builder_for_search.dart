import 'package:flutter/material.dart';
import 'package:netflix/Api/api.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Widgets/search_idle.dart';

class FutureBuilderForSearch extends StatelessWidget {
  const FutureBuilderForSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api().forSearchDara(),
      builder: (context, snapshot) {
        if (snapshot.hasError ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];
                return TopSearchItemTile(
                  movie: data,
                );
              },
              separatorBuilder: (context, index) => kHeight,
              itemCount: snapshot.data!.length);
        }
      },
    );
  }
}
