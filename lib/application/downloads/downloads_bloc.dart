import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_fazard.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsFazard _downloadsFazard;
  DownloadsBloc(this._downloadsFazard) : super(DownloadsState.initial()) {
    on<_GetDownloads>((event, emit) async {
      if (state.downloads.isNotEmpty) {
        emit(
          state.copyWith(
            isLoading: false,
            downloads: state.downloads,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          //Setting loading as true because API calling has started
          isLoading: true,
          //Currently we dont have result because its loading
          downloadSuccessOrFailureOption: none(),
        ),
      );
      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadsFazard.getDownloads();
      log(downloadsOption.toString());
      // Replacing the state after API call has finished
      emit(
        // Splitting the Left side and Right side of the downloadsOption
        downloadsOption.fold(
          (failure) => state.copyWith(
            //Loading is setting as true because the API call has ended and we have some results which is either failure or success
            isLoading: false,
            //We have some data because API call has ende.Here on left side we have failure so assigning the MainFailure Class
            downloadSuccessOrFailureOption: Some(Left(failure)),
          ),
          (success) => state.copyWith(
            //Loading is setting as true because the API call has ended and we have some results which is either failure or success
            isLoading: false,
            //We have some data because API call has ende.Here on right side we have success so assigning the List<Downloads>
            downloadSuccessOrFailureOption: Some(Right(success)),
            //If success then there will be data. So passing the success in this case it's List<Downloads>
            downloads: success,
          ),
        ),
      );
    });
  }
}
