import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorInitial()) {
    // ColorBloc() : super(ColorInitial(initColors: Colors.blue)) {
    on<ColorEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ChangeColorEvent>((event, emit) {
      List<Color> themeColor = [
        Colors.pink,
        Colors.purple,
        Colors.orange,
        Colors.red,
        Colors.blueAccent,
      ];
      emit(ColorLoading());
      // debugPrint("berhasil");
      emit(ColorSuccess(colors: themeColor[event.num!.toInt()]));
      // emit(ColorSuccess(colors: event.colors));
    });
  }
}
