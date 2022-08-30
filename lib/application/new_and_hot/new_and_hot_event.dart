part of 'new_and_hot_bloc.dart';

@freezed
class NewAndHotEvent with _$NewAndHotEvent {
  const factory NewAndHotEvent.fetchComingSoon() = FetchComingSoon;
  const factory NewAndHotEvent.fetchEveryOneIsWatching() =
      FetchEveryOneIsWatching;
}
