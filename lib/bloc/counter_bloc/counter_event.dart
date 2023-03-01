part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends CounterEvent {
  final int number;

  const IncrementEvent({this.number = 1});
}

class DecrementEvent extends CounterEvent {}
