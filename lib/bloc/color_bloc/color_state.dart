part of 'color_bloc.dart';

@immutable
abstract class ColorState {}

class ColorInitial extends ColorState {
  // final Color? initColors;
  // ColorInitial({
  //   this.initColors = Colors.blue,
  // });
}

class ColorLoading extends ColorState {}

class ColorError extends ColorState {}

class ColorSuccess extends ColorState {
  // final int? num;
  final Color? colors;

  ColorSuccess({
    // this.num,
    this.colors,
  });
}
