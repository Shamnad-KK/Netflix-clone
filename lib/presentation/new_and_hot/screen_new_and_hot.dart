import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/new_and_hot/new_and_hot_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                size: 30,
                color: Colors.white,
              ),
              kWidth10,
              Container(
                color: Colors.blue,
                width: 28,
                height: 20,
              ),
              kWidth10,
            ],
            bottom: TabBar(
              labelColor: kBlackColor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: kWhiteColor,
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              isScrollable: true,
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(
                  text: '👀 Everyone\'s Watching',
                ),
              ],
              indicator: BoxDecoration(
                  color: kWhiteColor, borderRadius: kBorderRadius30),
            ),
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              ComingSoonList(
                key: Key('coming soon list'),
              ),
              EveryOneIsWatchingList(
                key: Key('everyone is watching list'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<NewAndHotBloc>(context).add(const FetchComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NewAndHotBloc>(context).add(const FetchComingSoon());
      },
      child: BlocBuilder<NewAndHotBloc, NewAndHotState>(
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
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('Error occured'),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                String month = '';
                String day = '';
                try {
                  final DateTime? date = DateTime.tryParse(movie.releaseDate!);
                  final String formattedDate =
                      DateFormat.yMMMMd('en-US').format(date!);
                  month = formattedDate.split(" ").first.substring(0, 3);
                  day = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  day = '';
                }

                return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: month,
                    day: day,
                    posterPath: "$imageAppendURL${movie.posterPath}",
                    movieName: movie.title ?? 'No Title',
                    overview: movie.overview ?? 'No description');
              },
              itemCount: state.comingSoonList.length,
            );
          }
        },
      ),
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<NewAndHotBloc>(context)
          .add(const FetchEveryOneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NewAndHotBloc>(context)
            .add(const FetchEveryOneIsWatching());
      },
      child: BlocBuilder<NewAndHotBloc, NewAndHotState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error occured'),
            );
          } else if (state.everyOneIsWatchinhList.isEmpty) {
            return const Center(
              child: Text('Error occured'),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                final tv = state.everyOneIsWatchinhList[index];
                if (tv.id == null) {
                  return const SizedBox();
                }

                return EveryOnesWatchingWidget(
                    posterPath: "$imageAppendURL${tv.posterPath}",
                    seriesName: tv.originalName ?? 'No Title',
                    overview: tv.overview ?? 'No description');
              },
              itemCount: state.everyOneIsWatchinhList.length,
            );
          }
        },
      ),
    );
  }
}
