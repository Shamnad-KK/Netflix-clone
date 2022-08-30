import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  const VideoListItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _videoPlayerController;
  late bool isPlaying;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(
        videoUrlList[widget.index % videoUrlList.length]);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
    });
    isPlaying = true;
    if (isPlaying == true) {
      _videoPlayerController.play();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movies.posterPath;
    return Stack(
      children: [
        FastLaughVideoPlayer(
            videoPlayerController: _videoPlayerController,
            onStateChanged: (isPLaying) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: kWhiteColor,
                      size: 30,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPath == null
                            ? const NetworkImage(
                                "https://ayupearl.com/wp-content/themes/dp-voyageur/img/post_thumbnail/noimage.png")
                            : NetworkImage(
                                "$imageAppendURL/$posterPath",
                              ),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdNotifier,
                      builder: (BuildContext context, Set intex, Widget? _) {
                        if (likedVideosIdNotifier.value
                            .contains(widget.index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdNotifier.value.remove(widget.index);
                              likedVideosIdNotifier.notifyListeners();
                            },
                            child: const VideoActionWidget(
                              icon: Icons.favorite,
                              title: 'Liked',
                              liked: true,
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdNotifier.value.add(widget.index);
                              likedVideosIdNotifier.notifyListeners();
                            },
                            child: const VideoActionWidget(
                                icon: Icons.emoji_emotions, title: 'LOL'),
                          );
                        }
                      },
                    ),
                    const VideoActionWidget(icon: Icons.add, title: 'My List'),
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)
                                ?.movies
                                .posterPath;
                        log(movieName.toString());
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: const VideoActionWidget(
                          icon: Icons.share, title: 'Share'),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPlaying = !isPlaying;
                          isPlaying == true
                              ? _videoPlayerController.pause()
                              : _videoPlayerController.play();
                        });
                      },
                      child: VideoActionWidget(
                        icon:
                            isPlaying == true ? Icons.pause : Icons.play_arrow,
                        title: isPlaying == true ? "Pause" : 'Play',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.liked = false,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final bool? liked;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: liked == false ? kWhiteColor : Colors.red,
          ),
          Text(
            title,
            style: const TextStyle(
              color: kWhiteColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movies;

  const VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movies,
  }) : super(
          key: key,
          child: widget,
        );
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movies != movies;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class FastLaughVideoPlayer extends StatelessWidget {
  const FastLaughVideoPlayer({
    Key? key,
    required this.onStateChanged,
    required this.videoPlayerController,
  }) : super(key: key);

  final void Function(bool isPlaying) onStateChanged;
  final VideoPlayerController videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: VideoPlayer(videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }
}
