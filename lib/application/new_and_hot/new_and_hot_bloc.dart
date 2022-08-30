import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/models/new_and_hot_response.dart';
import 'package:netflix_clone/domain/hot_and_new/new_and_hot_fazard.dart';

part 'new_and_hot_event.dart';
part 'new_and_hot_state.dart';
part 'new_and_hot_bloc.freezed.dart';

@injectable
class NewAndHotBloc extends Bloc<NewAndHotEvent, NewAndHotState> {
  final INewAndHotFazard newAndHotFazard;
  NewAndHotBloc(this.newAndHotFazard) : super(NewAndHotState.initial()) {
    on<FetchComingSoon>((event, emit) async {
      if (state.comingSoonList.isNotEmpty) {
        emit(
          state.copyWith(
            comingSoonList: state.comingSoonList,
            everyOneIsWatchinhList: state.everyOneIsWatchinhList,
            isLoading: false,
            isError: false,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          comingSoonList: [],
          everyOneIsWatchinhList: [],
          isLoading: true,
          isError: false,
        ),
      );
      final comingSoonList = await newAndHotFazard.getHotAndNewMovieData();
      comingSoonList.fold((MainFailure failure) {
        emit(
          state.copyWith(
            comingSoonList: [],
            everyOneIsWatchinhList: [],
            isLoading: false,
            isError: true,
          ),
        );
      }, (NewAndHotResponse success) {
        emit(
          state.copyWith(
            comingSoonList: success.results,
            everyOneIsWatchinhList: state.everyOneIsWatchinhList,
            isLoading: false,
            isError: false,
          ),
        );
      });
    });
    on<FetchEveryOneIsWatching>((event, emit) async {
      if (state.everyOneIsWatchinhList.isNotEmpty) {
        emit(
          state.copyWith(
            comingSoonList: state.comingSoonList,
            everyOneIsWatchinhList: state.everyOneIsWatchinhList,
            isLoading: false,
            isError: false,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          comingSoonList: [],
          everyOneIsWatchinhList: [],
          isLoading: true,
          isError: false,
        ),
      );
      final everyOneIsWatchingList = await newAndHotFazard.getHotAndNewTvData();
      everyOneIsWatchingList.fold((MainFailure failure) {
        emit(
          state.copyWith(
            comingSoonList: [],
            everyOneIsWatchinhList: [],
            isLoading: false,
            isError: true,
          ),
        );
      }, (NewAndHotResponse success) {
        emit(
          state.copyWith(
            comingSoonList: state.comingSoonList,
            everyOneIsWatchinhList: success.results,
            isLoading: false,
            isError: false,
          ),
        );
      });
    });
  }
}
