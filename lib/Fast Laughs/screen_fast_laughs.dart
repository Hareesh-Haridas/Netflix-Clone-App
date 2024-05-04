import 'package:flutter/material.dart';
import 'package:netflix/Api/api.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Widgets/video_list_item.dart';

ValueNotifier<List<String>> videoUrls = ValueNotifier<List<String>>([]);

class ScreenFastlaugh extends StatefulWidget {
  const ScreenFastlaugh({super.key});

  @override
  State<ScreenFastlaugh> createState() => _ScreenFastlaughState();
}

class _ScreenFastlaughState extends State<ScreenFastlaugh> {
  late Future<List<String>> videoUrlsFuture;
  @override
  void initState() {
    super.initState();
    videoUrlsFuture = Api().getFastLaughVideoUrls();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: videoUrlsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            videoUrls.value = snapshot.data as List<String>;
            return PageView.builder(
                itemCount: videoUrls.value.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => VideoListItem(
                      imageUrl: trendingNowListNotifier.value[index].posterPath,
                      videourl: videoUrls.value[index],
                    ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
