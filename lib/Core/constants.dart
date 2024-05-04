import 'package:flutter/material.dart';
import 'package:netflix/Models/movies.dart';

const kWidth = SizedBox(
  width: 10,
);
const kHeight = SizedBox(
  height: 10,
);
const kHeight20 = SizedBox(
  height: 20,
);
const kheight50 = SizedBox(
  height: 50,
);
//Border radius
final BorderRadius kRadius10 = BorderRadius.circular(10);
final BorderRadius kRadius30 = BorderRadius.circular(30);
//image
const kMainImage =
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg";
//TextStyle
TextStyle kHomeTitleText = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);
const NewAndHotTempimage =
    "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/zEqfkiyWZILZKy2M1lgeGmIRzYR.jpg";
const NewAndHotTempImage2 =
    "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/oFSQEG1lJTTISj3QKB7cJ9ANkFw.jpg";
//apiKey
const apikey = "360c855158890cc8c1786364e4e7505c";
const imagePath = 'https://image.tmdb.org/t/p/w500';
//notifiers
ValueNotifier<List<Movie>> trendingNowListNotifier = ValueNotifier([]);
ValueNotifier<List<Movie>> topRatedListNotifeir = ValueNotifier([]);
ValueNotifier<List<Movie>> top10TvShowsInIndiaTodayListNotifeir =
    ValueNotifier([]);
ValueNotifier<List<Movie>> upComingListNotifeir = ValueNotifier([]);
ValueNotifier<List<Movie>> searchResultListNotifeir = ValueNotifier([]);
