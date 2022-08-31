import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
    required this.imageUrlList,
  }) : super(key: key);
  final List<String> imageUrlList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitle(
            title: 'Top 10 TV Shows in India Today',
          ),
          kHeight10,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                imageUrlList.length,
                (index) => NumberCard(
                  index: index,
                  imageUrl: imageUrlList[index],
                ),
              ),
            ),
          ),
          kHeight10
        ],
      ),
    );
  }
}
