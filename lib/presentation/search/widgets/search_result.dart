import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Movies & TV',
        ),
        kHeight10,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 1.4,
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(
                    state.searchResultList.length,
                    (index) => MainCard(
                          imageURL:
                              "$imageAppendURL${state.searchResultList[index].posterPath}",
                        )),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key, required this.imageURL}) : super(key: key);
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image:
            DecorationImage(image: NetworkImage(imageURL), fit: BoxFit.cover),
      ),
    );
  }
}
