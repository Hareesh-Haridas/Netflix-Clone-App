import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/Api/api.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Home/Widgets/background_card.dart';
import 'package:netflix/Home/Widgets/number_title_card.dart';
import 'package:netflix/Widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
int randomindex = 0;

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  fetchDatas() async {
    trendingNowListNotifier.value = await Api().getTrendingMovies();
    topRatedListNotifeir.value = await Api().getTopRated();
    upComingListNotifeir.value = await Api().getUpComing();
    top10TvShowsInIndiaTodayListNotifeir.value =
        await Api().getTop10TvShowsInIndiaToday();
    final random = Random();
    randomindex = random.nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    fetchDatas();
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    FutureBuilder(
                      future: Api().getTrendingMovies(),
                      builder: (context, snapshot) => snapshot.hasData
                          ? BackgroundCard(
                              image: snapshot.data![randomindex].posterPath)
                          : const SizedBox(
                              height: 700,
                              width: double.infinity,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                    ),
                    kHeight,
                    // BackgroundCard(),
                    MainTitleCard(
                      title: "Top Rated",
                      listNotifier: topRatedListNotifeir,
                    ),
                    kHeight,
                    MainTitleCard(
                      title: "Trending Now",
                      listNotifier: trendingNowListNotifier,
                    ),
                    kHeight,
                    const NumberTitleCard(),
                    kHeight,
                    MainTitleCard(
                      title: "Upcoming",
                      listNotifier: upComingListNotifeir,
                    ),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 1000,
                        ),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://blog.ventunotech.com/wp-content/uploads/2022/06/netflix-logo-circle-png-5.png",
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                kWidth,
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'),
                                          fit: BoxFit.cover)),
                                ),
                                kWidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  "Movies",
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  "Categories",
                                  style: kHomeTitleText,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}
