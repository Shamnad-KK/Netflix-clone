part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState({
    required List<Downloads> videoList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory FastLaughState.initial() {
    return const FastLaughState(
      videoList: [],
      isError: false,
      isLoading: true,
    );
  }
}
