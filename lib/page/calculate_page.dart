import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.tealAccent,
        title: Text(
          "Calculate Page",
          // style: GoogleFonts.poppins(),
        ),
      ),
    );
  }
}
