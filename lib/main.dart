import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resistance_calculator/constants.dart';
import 'package:resistance_calculator/logic/bloc/resistance_calculator_bloc.dart';
import 'package:resistance_calculator/logic/calculation_logic.dart';
import 'package:resistance_calculator/presentation/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResistanceCalculatorBloc(
        calculationLogic: new CalculationLogic(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Resistance Calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: kDarkBlueColor,
        ),
        home: HomePage(),
      ),
    );
  }
}
