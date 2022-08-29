import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/search/models/search_response/search_response.dart';

abstract class ISearchFazard {
  Future<Either<MainFailure, SearchResponse>> getSearchMovies({
    required String movieQuery,
  });
}
