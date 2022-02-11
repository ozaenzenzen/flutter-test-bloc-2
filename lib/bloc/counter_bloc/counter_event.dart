part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterCalculation extends CounterEvent {
  final double numIncrement1;
  final double numIncrement2;

  CounterCalculation(this.numIncrement1, this.numIncrement2);
}

// class CounterDecrement extends CounterEvent {
//   final double numDecrement;

//   CounterDecrement(this.numDecrement);
// }
