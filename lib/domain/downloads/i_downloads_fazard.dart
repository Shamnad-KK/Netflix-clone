import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

//Declaring the controller functions for downloads repository in a abstract class for implementing this method
abstract class IDownloadsFazard {
  //When this method is called from the bloc file , The method from the repostory will called
  Future<Either<MainFailure, List<Downloads>>> getDownloads();
}
