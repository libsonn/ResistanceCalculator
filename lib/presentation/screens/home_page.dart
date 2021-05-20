import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:resistance_calculator/constants.dart';
import 'package:resistance_calculator/presentation/widgets/information_about_resistor.dart';
import 'package:resistance_calculator/presentation/widgets/lines_pickers.dart';
import 'package:resistance_calculator/presentation/widgets/number_of_lines_picker.dart';
import 'package:resistance_calculator/presentation/widgets/resistor_symbol.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlueColor,
      appBar: AppBar(
        backgroundColor: kLightBlueColor,
        title: Text(
          'Resistance calculator',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: kDarkBlueColor,
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    NumberOfLinesPicker(),
                    LinesPickers(),
                    ResistorSymbol(),
                    InformationAboutResistor()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
