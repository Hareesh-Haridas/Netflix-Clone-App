import 'package:flutter/material.dart';
import 'package:netflix/Home/Widgets/number_card.dart';

import '../../Core/constants.dart';
import '../../Widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: "Top 10 TV Shows In India Today",
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          // child: ListView(
          //   scrollDirection: Axis.horizontal,
          //   children: List.generate(
          //     10,
          //     (index) => NumberCard(
          //       index: index,
          //     ),
          //   ),
          // ),
          child: ValueListenableBuilder(
              valueListenable: top10TvShowsInIndiaTodayListNotifeir,
              builder: (context, value, _) {
                return ListView.builder(
                    itemCount:
                        top10TvShowsInIndiaTodayListNotifeir.value.isNotEmpty
                            ? 10
                            : top10TvShowsInIndiaTodayListNotifeir.value.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var data = value[index];
                      return NumberCard(
                        index: index,
                        movie: data,
                      );
                    });
              }),
        )
      ],
    );
  }
}
