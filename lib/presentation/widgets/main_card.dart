import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

const imageURL =
    'https://www.themoviedb.org/t/p/w220_and_h330_face/ox4goZd956BxqJH6iLwhWPL9ct4.jpg';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: kBorderRadius20,
        image: const DecorationImage(
          image: NetworkImage(
            imageURL,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
