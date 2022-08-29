import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_fazard.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

@LazySingleton(as: IDownloadsFazard)
class DownloadsRepository implements IDownloadsFazard {
  //Declaring the body for the fazard of downloads by implementing the class and overriding the method
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloads() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        /* Images are on "results" which is a List of map. So here we are taking the result as a List and mapping the poster_path
        only and assigning complete Downloads models to the List downloadsList.
        */
        final List<Downloads> downloadsList = (response.data['results'] as List)
            .map((posterPath) => Downloads.fromJson(posterPath))
            .toList();
        log(downloadsList.toString());

        return Right(downloadsList);
      } else {
        //Here we have the response but it's not anyone from the if condition. So this is a server error
        return const Left(
          MainFailure.serverFailure(),
        ); //Return type is either left or right
      }
    } catch (e) {
      print(e.toString());
      //So the error is not from the server side then It is from client side
      return const Left(
        MainFailure.clientFailure(), //Return type is either left or right
      );
    }
  }
}
