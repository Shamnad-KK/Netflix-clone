import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/screen_downloads.dart';
import 'package:netflix_clone/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_clone/presentation/home/screen_home.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);
  final List _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: currentIndexNotifier,
            builder: (context, int value, child) {
              return _pages[value];
            }),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
