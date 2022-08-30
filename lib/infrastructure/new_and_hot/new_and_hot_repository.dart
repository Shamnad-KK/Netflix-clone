import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/hot_and_new/new_and_hot_fazard.dart';
import 'package:netflix_clone/domain/hot_and_new/models/new_and_hot_response.dart';

@LazySingleton(as: INewAndHotFazard)
class HotAndNewRepository implements INewAndHotFazard {
  @override
  Future<Either<MainFailure, NewAndHotResponse>> getHotAndNewMovieData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewMovie);
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final movieResult = NewAndHotResponse.fromJson(response.data);
        return Right(movieResult);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, NewAndHotResponse>> getHotAndNewTvData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewTv);
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final movieResult = NewAndHotResponse.fromJson(response.data);
        return Right(movieResult);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
