import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      decoration: BoxDecoration(
        borderRadius: kBorderRadius20,
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
