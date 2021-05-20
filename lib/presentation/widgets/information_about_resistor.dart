import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resistance_calculator/logic/bloc/resistance_calculator_bloc.dart';

import '../../constants.dart';

class InformationAboutResistor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        BlocBuilder<ResistanceCalculatorBloc, ResistanceCalculatorState>(
          builder: (context, state) {
            return Text(
              state.resistorModel.toString(),
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: kLightBlueColor,
              ),
            );
          },
        ),
      ],
    );
  }
}
