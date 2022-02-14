import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:test_bloc_2/bloc/counter_bloc/counter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  @override
  void initState() {
    BlocProvider.of<CounterBloc>(context);
    super.initState();
  }

  TextEditingController _firstNum = TextEditingController(text: "${2.toInt()}");
  TextEditingController _secondNum = TextEditingController(text: "${5.toInt()}");

  var result = 0;
  var errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      bloc: BlocProvider.of<CounterBloc>(context),
      listener: (context, state) {
        if (state is CounterCalculated) {
          result = state.result.toInt();
        }
        if (state is CounterError) {
          errorMessage = state.errorMessage;
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        debugPrint("state sekarang: $state");
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text(
              "Calculate Page",
              // style: GoogleFonts.poppins(),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _firstNum,
                decoration: InputDecoration(hintText: "First Num"),
              ),
              TextField(
                controller: _secondNum,
                decoration: InputDecoration(hintText: "Second Num"),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(
                    CounterIncrement(
                      double.parse(_firstNum.text),
                      double.parse(_secondNum.text),
                    ),
                  );
                },
                child: Text("Calculate"),
              ),
              if (state is CounterCalculated) Text("Hasilnya: ${result}"),
              if (state is CounterError)
                Text(
                  "Hasilnya: ${errorMessage}",
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        );
      },
    );
  }
}
