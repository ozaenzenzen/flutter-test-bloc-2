import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_bloc_2/bloc/color_bloc/color_bloc.dart';
import 'package:test_bloc_2/page/calculate_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color mainColor = Colors.teal;
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
              mainColor = state.colors!;
            }
          },
          builder: (context, state) {
            return AppBar(
              title: Text("Testing"),
              backgroundColor: mainColor,
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<ColorBloc, ColorState>(
            listener: (context, state) {
              if (state is ColorSuccess) {
                mainColor = state.colors!;
              }
            },
            builder: (context, state) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Builder(builder: (context) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: mainColor,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CalculatePage()),
                          );
                        },
                        child: Text("Counter Page"),
                      );
                    }),
                    ElevatedButton(
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
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
