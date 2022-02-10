part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterIncrement extends CounterEvent {
  final double numIncrement;
  CounterIncrement(this.numIncrement);
}

class CounterDecrement extends CounterEvent {
  final double numDecrement;

  CounterDecrement(this.numDecrement);
}
