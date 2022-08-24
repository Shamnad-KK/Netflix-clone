import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, bool value, Widget? _) {
          return SafeArea(
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
                  ListView(
                    children: const [
                      BackgroundCard(),
                      MainTitleCard(
                        title: 'Released in the past year',
                      ),
                      MainTitleCard(
                        title: 'Trending Now',
                      ),
                      NumberTitleCard(),
                      MainTitleCard(
                        title: 'Tense Dramas',
                      ),
                      MainTitleCard(
                        title: 'South Indian Cinema',
                      ),
                    ],
                  ),
                  scrollNotifier.value == true
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
                                    color: Colors.blue,
                                    width: 28,
                                    height: 24,
                                  ),
                                  kWidth10,
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                      : kHeight10,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
