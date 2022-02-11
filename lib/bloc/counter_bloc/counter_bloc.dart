import 'package:bloc/bloc.dart';
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
      emit(CounterLoading());
      try {
        emit(CounterCalculated(
          counterServices!.incrementFunction(event.numIncrement1, event.numIncrement2),
        ));
      } catch (e) {
        emit(CounterError(e.toString()));
      }
    });
    on<CounterDecrement>((event, emit) {
      emit(CounterLoading());
      try {
        emit(CounterCalculated(
          counterServices!.incrementFunction(event.numDecrement1, event.numDecrement2),
        ));
      } catch (e) {
        emit(CounterError(e.toString()));
      }
    });
  }
}
