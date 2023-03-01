part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  final int number;

  const CounterState(this.number);

  @override
  List<Object> get props => [number];
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterLoaded extends CounterState {
  const CounterLoaded(int number) : super(number);
}
