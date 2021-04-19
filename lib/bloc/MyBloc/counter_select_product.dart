import 'dart:async';
import 'package:bloc/bloc.dart';

enum EventStatus { increment, decrement, clearState, clearAll }

class CounterEvent {
  final int value;
  final EventStatus status;

  const CounterEvent({this.value, this.status});
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(1);
  int itemCart = 1;
  bool show = false;

  @override
  Stream<int> mapEventToState(event) async* {
    if (event.status == EventStatus.increment) {
      yield state + event.value;
      itemCart = itemCart + state;
    } else if (event.status == EventStatus.decrement) {
      yield state - event.value;
      itemCart = itemCart - state;
    } else if (event.status == EventStatus.clearState) {
      yield (state * 0) + 1;
      show = true;
    } else if (event.status == EventStatus.clearAll) {
      yield itemCart = 1;
      show = false;
    }
  }
}
