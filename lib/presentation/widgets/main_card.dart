import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result.dart';

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
