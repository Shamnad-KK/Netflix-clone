import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_fazard.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final List videoUrlList = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
];

final ValueNotifier<Set<int>> likedVideosIdNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  final IDownloadsFazard downloadsFazard;
  FastLaughBloc(this.downloadsFazard) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(
        state.copyWith(videoList: [], isLoading: true, isError: false),
      );
      final videoList = await downloadsFazard.getDownloads();
      videoList.fold((MainFailure failure) {
        emit(
          state.copyWith(
            videoList: [],
            isLoading: false,
            isError: true,
          ),
        );
      }, (List<Downloads> success) {
        emit(
          state.copyWith(
            videoList: success,
            isLoading: false,
            isError: false,
          ),
        );
      });
    });
    on<LikeVideo>((event, emit) async {
      likedVideosIdNotifier.value.add(event.id);
    });
    on<DislikeVideo>((event, emit) async {
      likedVideosIdNotifier.value.remove(event.id);
    });
  }
}
