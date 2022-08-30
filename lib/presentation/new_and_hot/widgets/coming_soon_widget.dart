import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.overview,
  }) : super(key: key);
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    month,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kGreyColor,
                    ),
                  ),
                  Text(
                    day,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoWidget(
                    image: posterPath,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movieName,
                          style: const TextStyle(
                            letterSpacing: -5,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                          CustomButtonWidget(
                            icon: Icons.notification_add,
                            iconSize: 16,
                            title: 'Remind Me',
                            textSize: 13,
                          ),
                          kWidth10,
                          CustomButtonWidget(
                            icon: Icons.notification_add,
                            iconSize: 16,
                            title: 'Info',
                            textSize: 13,
                          ),
                          kWidth10
                        ],
                      )
                    ],
                  ),
                  kHeight10,
                  Text('Coming on $month $day'),
                  kHeight10,
                  Text(
                    movieName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kHeight10,
                  Text(
                    overview,
                    style: const TextStyle(
                      color: kGreyColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        kHeight20
      ],
    );
  }
}
