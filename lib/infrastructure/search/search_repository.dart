import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/search/i_search_fazard.dart';
import 'package:netflix_clone/domain/search/models/search_response/search_response.dart';

@LazySingleton(as: ISearchFazard)
class SearchRepository implements ISearchFazard {
  @override
  Future<Either<MainFailure, SearchResponse>> getSearchMovies(
      {required String movieQuery}) async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.search, queryParameters: {
        'query': movieQuery,
      });
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final searchResult = SearchResponse.fromJson(response.data);
        return Right(searchResult);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
