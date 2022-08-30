part of 'new_and_hot_bloc.dart';

@freezed
class NewAndHotState with _$NewAndHotState {
  const factory NewAndHotState({
    required List<NewAndHotResult> comingSoonList,
    required List<NewAndHotResult> everyOneIsWatchinhList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;
  factory NewAndHotState.initial() {
    return const NewAndHotState(
        comingSoonList: [],
        everyOneIsWatchinhList: [],
        isLoading: true,
        isError: false);
  }
}
