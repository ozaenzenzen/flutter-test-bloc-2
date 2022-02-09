part of 'color_bloc.dart';

@immutable
abstract class ColorEvent {}

class ChangeColorEvent extends ColorEvent {
  //  Color? colors;
   int? num;

  ChangeColorEvent({
    this.num,
    // this.colors,
  });
}
