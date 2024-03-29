import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_bloc_2/bloc/color_bloc/color_bloc.dart';
import 'package:test_bloc_2/bloc/counter_bloc/counter_bloc.dart';
import 'package:test_bloc_2/page/calculate_page.dart';
import 'package:test_bloc_2/page/main_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ColorBloc()),
        BlocProvider(create: (context) => CounterBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return MaterialApp(
            title: 'Test Bloc 2',
            debugShowCheckedModeBanner: false,
            // routes: <String, WidgetBuilder>{
            //   '/': (BuildContext context) => const MainPage(),
            //   '/counterPage': (BuildContext context) => const CalculatePage(),
            // },
            // builder: (context, widget) {
            //   ScreenUtil.setContext(context);
            //   return MediaQuery(
            //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            //     child: const MainPage(),
            //   );
            // },
            home: Builder(builder: (context) {
              ScreenUtil.setContext(context);
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: const MainPage(),
              );
            }),
          );
        },
      ),
    );
  }
}
