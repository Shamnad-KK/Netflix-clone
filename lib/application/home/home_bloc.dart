import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/models/new_and_hot_response.dart';
import 'package:netflix_clone/domain/hot_and_new/new_and_hot_fazard.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final INewAndHotFazard homeFazard;
  HomeBloc(this.homeFazard) : super(HomeState.initial()) {
    on<GetHomeScreenData>((event, emit) async {
      emit(
        state.copyWith(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingNowMovieList: [],
            southIndianMovieList: [],
            tenseDramasTvList: [],
            trendingNowTvList: [],
            isLoading: true,
            isError: false),
      );

      final movieData = await homeFazard.getHotAndNewMovieData();
      final tvData = await homeFazard.getHotAndNewTvData();

      movieData.fold(
        (MainFailure failure) {
          emit(HomeState(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: [],
              trendingNowMovieList: [],
              southIndianMovieList: [],
              tenseDramasTvList: [],
              trendingNowTvList: [],
              isLoading: false,
              isError: true));
        },
        (NewAndHotResponse success) {
          final pastYear = success.results;
          pastYear.shuffle();
          final trending = success.results;
          trending.shuffle();
          final dramas = success.results;
          dramas.shuffle();
          final southIndian = success.results;
          southIndian.shuffle();
          emit(HomeState(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: pastYear,
              trendingNowMovieList: trending,
              southIndianMovieList: southIndian,
              tenseDramasTvList: dramas,
              trendingNowTvList: state.trendingNowTvList,
              isLoading: false,
              isError: false));
        },
      );
      tvData.fold(
        (MainFailure failure) {
          emit(HomeState(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: [],
              trendingNowMovieList: [],
              southIndianMovieList: [],
              tenseDramasTvList: [],
              trendingNowTvList: [],
              isLoading: false,
              isError: true));
        },
        (NewAndHotResponse success) {
          final top10TvShows = success.results;
          top10TvShows.shuffle();
          emit(HomeState(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: state.pastYearMovieList,
              trendingNowMovieList: state.trendingNowMovieList,
              southIndianMovieList: state.southIndianMovieList,
              tenseDramasTvList: state.tenseDramasTvList,
              trendingNowTvList: top10TvShows,
              isLoading: false,
              isError: false));
        },
      );
    });
  }
}
