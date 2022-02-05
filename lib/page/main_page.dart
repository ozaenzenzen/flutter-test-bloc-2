import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_bloc_2/bloc/bloc/color_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color mainColor = Colors.blueGrey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          ScreenUtil().screenWidth,
          ScreenUtil().setHeight(40),
        ),
        child: BlocConsumer<ColorBloc, ColorState>(
          listener: (context, state) {
            if (state is ColorSuccess) {
              // AppBar(
              //   title: Text("Testing"),
              //   backgroundColor: state.colors,
              // );
              mainColor = state.colors!;
            }
          },
          builder: (context, state) {
            return AppBar(
              title: Text("Testing"),
              backgroundColor: mainColor,
            );
          },
          // child: AppBar(
          //   title: Text("Testing"),
          //   backgroundColor: mainColor,
          // ),
        ),
      ),
      body: BlocConsumer<ColorBloc, ColorState>(
        listener: (context, state) {
          if (state is ColorSuccess) {
            mainColor = state.colors!;
          }
        },
        builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: mainColor,
              ),
              onPressed: () {
                // debugPrint("Testing");
                // BlocProvider.of<ColorBloc>(context).add(ChangeColorEvent(colors: Colors.red));
                BlocProvider.of<ColorBloc>(context).add(ChangeColorEvent(num: Random().nextInt(5)));
              },
              child: Text("Change Color"),
            ),
          );
        },
        // child: Container(
        //   alignment: Alignment.center,
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //       primary: mainColor,
        //     ),
        //     onPressed: () {
        //       debugPrint("Testing");
        //       // context.read<ColorBloc>().add(ChangeColorEvent(colors: Colors.red));
        //       BlocProvider.of<ColorBloc>(context).add(ChangeColorEvent(colors: Colors.red));
        //     },
        //     child: Text("Change Color"),
        //   ),
        // ),
      ),
    );
  }
}
