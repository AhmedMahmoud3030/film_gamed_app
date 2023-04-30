// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'watch_list_event.dart';
part 'watch_list_state.dart';

class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  WatchListBloc() : super(WatchListInitial()) {
    on<WatchListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
