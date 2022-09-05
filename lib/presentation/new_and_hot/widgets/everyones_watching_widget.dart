import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  const EveryOnesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.seriesName,
    required this.overview,
  }) : super(key: key);
  final String posterPath;
  final String seriesName;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            seriesName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        kHeight10,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'This hit sitcome follows the merry disadventures of siz 20-something pals as they navigate the pitfalls of work, life and love in 1980s Manhattan.',
            style: TextStyle(
              color: kGreyColor,
            ),
          ),
        ),
        kHeight20,
        VideoWidget(
          image: posterPath,
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.share,
              iconSize: 16,
              title: 'Share',
              textSize: 13,
            ),
            kWidth10,
            CustomButtonWidget(
              icon: Icons.add,
              iconSize: 16,
              title: 'My List',
              textSize: 13,
            ),
            kWidth10,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              iconSize: 16,
              title: 'Play',
              textSize: 13,
            ),
            kWidth10,
          ],
        ),
        kHeight50,
      ],
    );
  }
}
