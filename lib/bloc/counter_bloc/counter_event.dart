part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterIncrement extends CounterEvent {
  final double numIncrement1;
  final double numIncrement2;

  CounterIncrement(this.numIncrement1, this.numIncrement2);
}

class CounterDecrement extends CounterEvent {
  final double numDecrement1;
  final double numDecrement2;

  CounterDecrement(
    this.numDecrement1,
    this.numDecrement2,
  );
}
