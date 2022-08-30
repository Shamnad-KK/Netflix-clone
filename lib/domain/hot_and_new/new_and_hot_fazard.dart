import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/models/new_and_hot_response.dart';

abstract class INewAndHotFazard {
  Future<Either<MainFailure, NewAndHotResponse>> getHotAndNewMovieData();
  Future<Either<MainFailure, NewAndHotResponse>> getHotAndNewTvData();
}
