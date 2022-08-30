import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/presentation/fast_laugh/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isLoading) {
              return const Center(
                child: Text("Error while loading video"),
              );
            } else if (state.videoList.isEmpty) {
              return const Center(
                child: Text("No video"),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  state.videoList.length,
                  (index) => VideoListItemInheritedWidget(
                    widget: VideoListItem(
                        key: Key(
                          index.toString(),
                        ),
                        index: index),
                    movies: state.videoList[index],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
