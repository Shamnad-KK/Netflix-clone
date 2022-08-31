import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/domain/hot_and_new/models/new_and_hot_response.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: SafeArea(
      child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          log(direction.toString());
          if (direction == ScrollDirection.forward) {
            scrollNotifier.value = true;
          } else if (direction == ScrollDirection.reverse) {
            scrollNotifier.value = false;
          }
          return true;
        },
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                } else if (state.isError) {
                  return const Center(
                    child: Text('Error occured'),
                  );
                } else {
                  //Released past year list
                  final List<String> pastYearRelease = state.pastYearMovieList
                      .map((NewAndHotResult movie) =>
                          "$imageAppendURL${movie.backdropPath}")
                      .toList();
                  pastYearRelease.shuffle();
                  //Trending Now Release
                  final List<String> trendingNow = state.trendingNowMovieList
                      .map((NewAndHotResult movie) =>
                          "$imageAppendURL${movie.backdropPath}")
                      .toList();
                  trendingNow.shuffle();
                  //Tense Drama list
                  final List<String> tenseDramas = state.pastYearMovieList
                      .map((NewAndHotResult movie) =>
                          "$imageAppendURL${movie.backdropPath}")
                      .toList();
                  tenseDramas.shuffle();
                  //South indian cinema list
                  final List<String> southIndianCinemas = state
                      .trendingNowMovieList
                      .map((NewAndHotResult movie) =>
                          "$imageAppendURL${movie.backdropPath}")
                      .toList();
                  southIndianCinemas.shuffle();
                  //South indian cinema list
                  final List<String> top10TvShows = state.trendingNowTvList
                      .map((NewAndHotResult movie) =>
                          "$imageAppendURL${movie.backdropPath}")
                      .toList();
                  southIndianCinemas.shuffle();
                  return ListView(
                    children: [
                      BackgroundCard(
                        imageUrl: trendingNow[0],
                      ),
                      MainTitleCard(
                        title: 'Released in the past year',
                        imageUrlList: pastYearRelease.sublist(0, 10),
                      ),
                      MainTitleCard(
                        title: 'Trending Now',
                        imageUrlList: trendingNow.sublist(0, 10),
                      ),
                      NumberTitleCard(
                        imageUrlList: top10TvShows.sublist(0, 10),
                      ),
                      MainTitleCard(
                        title: 'Tense Dramas',
                        imageUrlList: tenseDramas.sublist(0, 10),
                      ),
                      MainTitleCard(
                        title: 'South Indian Cinema',
                        imageUrlList: southIndianCinemas.sublist(0, 10),
                      ),
                    ],
                  );
                }
              },
            ),
            ValueListenableBuilder(
              builder: (BuildContext context, value, Widget? child) {
                return scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png',
                                  width: 70,
                                  height: 70,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                kWidth10,
                                Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png',
                                      ),
                                    ),
                                  ),
                                  width: 28,
                                  height: 24,
                                ),
                                kWidth10,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'TV Shows',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Movies',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Categories',
                                  style: kHomeTitleText,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : kHeight10;
              },
              valueListenable: scrollNotifier,
            )
          ],
        ),
      ),
    ));
  }
}
