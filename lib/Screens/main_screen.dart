import 'package:flutter/material.dart';
import 'package:netflix/Downloads/screen_downloads.dart';
import 'package:netflix/Fast%20Laughs/screen_fast_laughs.dart';
import 'package:netflix/Home/screen_home.dart';
import 'package:netflix/New_and_hot/screen_new_and_hot.dart';
import 'package:netflix/Search/screen_search_screen.dart';
import 'package:netflix/Widgets/bottom_navigation.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastlaugh(),
    const ScreenSearch(),
    ScreenDownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
