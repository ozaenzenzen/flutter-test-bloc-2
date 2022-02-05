import 'package:flutter/material.dart';
import 'package:test_bloc_2/main_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      
    );
  }
}