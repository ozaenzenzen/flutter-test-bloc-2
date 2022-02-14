import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test_bloc_2/services/counter_services.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterServices? counterServices;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CounterIncrement>((event, emit) {
      debugPrint("dapet angka berapa? ${event.numIncrement1} ${event.numIncrement2}");
      emit(CounterLoading());

      try {
        // var hasil = counterServices!.incrementFunction(
        //   event.numIncrement1.toDouble(),
        //   event.numIncrement2.toDouble(),
        // );

        double hasil = event.numIncrement1.toDouble() + event.numIncrement2.toDouble();

        // var hasil = 20.toDouble();
        // debugPrint("hasil: $hasil");
        emit(CounterCalculated(hasil));
      } catch (e) {
        emit(CounterError(e.toString()));
      }
    });
    on<CounterDecrement>((event, emit) {
      emit(CounterLoading());
      try {
        emit(CounterCalculated(
          counterServices!.incrementFunction(event.numDecrement1.toDouble(), event.numDecrement2.toDouble()),
        ));
      } catch (e) {
        emit(CounterError(e.toString()));
      }
    });
  }
}
