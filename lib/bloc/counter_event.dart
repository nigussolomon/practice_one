part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterTrigger extends CounterEvent {}

class CounterInc extends CounterEvent {}

class CounterDec extends CounterEvent {}
