part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String id,
    required List<NewAndHotResult> pastYearMovieList,
    required List<NewAndHotResult> trendingNowMovieList,
    required List<NewAndHotResult> southIndianMovieList,
    required List<NewAndHotResult> tenseDramasTvList,
    required List<NewAndHotResult> trendingNowTvList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;
  factory HomeState.initial() {
    return const HomeState(
        id: '0',
        pastYearMovieList: [],
        trendingNowMovieList: [],
        southIndianMovieList: [],
        tenseDramasTvList: [],
        trendingNowTvList: [],
        isLoading: true,
        isError: false);
  }
}
