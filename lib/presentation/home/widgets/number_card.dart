import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
            ),
            Container(
              // margin: const EdgeInsets.all(10),
              width: 130,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: kBorderRadius20,
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/ggFHVNu6YYI5L9pCfOacjizRGt.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 14,
          bottom: -25,
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: kWhiteColor,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                fontSize: 150,
                color: kBlackColor,
                decoration: TextDecoration.none,
                decorationColor: kWhiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
