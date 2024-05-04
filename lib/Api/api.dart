import 'dart:convert';
import 'dart:developer';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Models/movies.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingurl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=$apikey';
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingurl));
    if (response.statusCode == 200) {
      log('status code is ${response.statusCode}');
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<List<String>> getDownloadImageUrls() async {
    final response = await http.get(Uri.parse(_trendingurl));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData
          .map((movie) => Movie.fromJson(movie).posterPath)
          .toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  static const _topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey";
  Future<List<Movie>> getTopRated() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  static const _upComing =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey";
  Future<List<Movie>> getUpComing() async {
    final response = await http.get(Uri.parse(_upComing));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  static const _top10TvShowsInIndiaToday =
      "https://api.themoviedb.org/3/discover/tv?api_key=$apikey&with_original_language=hi&sort_by=popularity.desc";
  Future<List<Movie>> getTop10TvShowsInIndiaToday() async {
    final response = await http.get(Uri.parse(_top10TvShowsInIndiaToday));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  static const _forSearch =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=$apikey";
  Future<List<Movie>> forSearchDara() async {
    final response = await http.get(Uri.parse(_forSearch));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Movie>> searchResult(String movie) async {
    String resultApi =
        "https://api.themoviedb.org/3/search/movie?api_key=$apikey&query=$movie";
    final response = await http.get(Uri.parse(resultApi));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something went wrong');
    }
  }

  static const fastLaugh =
      "https://run.mocky.io/v3/e5b9ed99-e74a-4a1f-a624-aad618c77a85";
  Future<List<String>> getFastLaughVideoUrls() async {
    final response = await http.get(Uri.parse(fastLaugh));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["videoUrls"] as List;
      return responseData.map((videoUrl) => videoUrl as String).toList();
    } else {
      throw Exception('something went wrong');
    }
  }
}
