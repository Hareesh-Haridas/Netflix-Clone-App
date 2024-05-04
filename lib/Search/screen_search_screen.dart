import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Api/api.dart';
import 'package:netflix/Api/debouncer.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Widgets/search_idle.dart';
import 'package:netflix/Widgets/search_result_widget.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  bool changer = false;
  final searchController = TextEditingController();
  final ValueNotifier<bool> showSearchResult = ValueNotifier(false);
  getSearchList() async {
    final debouncer = Debouncer(delay: const Duration(milliseconds: 500));
    debouncer.call(() async {
      return searchResultListNotifeir.value =
          await Api().searchResult(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        showSearchResult.value = true;
        getSearchList();
      } else {
        showSearchResult.value = false;
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller: searchController,
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kHeight,
              Expanded(
                  child: ValueListenableBuilder<bool>(
                valueListenable: showSearchResult,
                builder: (context, value, child) {
                  return value
                      ? SearchResultWidget(result: searchController.text)
                      : const SearchIdleWidget();
                },
              ))
              // Expanded(
              //   child: SearchResultWidget(
              //     result: searchController.text,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
