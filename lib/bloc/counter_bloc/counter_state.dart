part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterLoading extends CounterState {}

class CounterCalculated extends CounterState {}

class CounterError extends CounterState {
  final String errorMessage;

  CounterError(this.errorMessage);
}
