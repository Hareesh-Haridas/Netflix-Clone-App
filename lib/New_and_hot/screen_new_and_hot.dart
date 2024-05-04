import 'package:flutter/material.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/New_and_hot/Widgets/coming_soon_widget.dart';
import 'package:netflix/New_and_hot/Widgets/everyoes_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: kWhiteColor,
                ),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                kWidth,
                Container(
                  width: 35,
                  height: 30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                kWidth,
              ],
              bottom: TabBar(
                labelColor: kBlackColor,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: kWhiteColor,
                isScrollable: true,
                indicator: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: kRadius30,
                ),
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(
                    text: "🍿 Coming Soon",
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ]),
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ValueListenableBuilder(
      valueListenable: upComingListNotifeir,
      builder: (context, value, _) {
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            var data = value[index];
            return ComingSoonWidget(movie: data);
          },
        );
      },
    );
  }

  Widget _buildEveryonesWatching() {
    return ValueListenableBuilder(
      valueListenable: topRatedListNotifeir,
      builder: (context, value, _) {
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            var data = value[index];
            return EveryonesWatchingWidget(
              movie: data,
            );
          },
        );
      },
    );
  }
}
