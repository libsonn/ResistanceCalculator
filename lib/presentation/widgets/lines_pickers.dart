import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resistance_calculator/constants.dart';
import 'package:resistance_calculator/logic/bloc/resistance_calculator_bloc.dart';
import 'package:resistance_calculator/presentation/widgets/five_lines_picker.dart';
import 'package:resistance_calculator/presentation/widgets/six_lines_picker.dart';

class LinesPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 500.0,
            minHeight: 40.0,
            maxWidth: 350.0,
          ),
          child:
              BlocBuilder<ResistanceCalculatorBloc, ResistanceCalculatorState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.resistorModel.numberOfLines,
                itemBuilder: (context, lineIndex) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Number of line: ${lineIndex + 1}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kLightBlueColor,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 300.0,
                          minHeight: 40.0,
                          maxWidth: 350.0,
                        ),
                        child: state.resistorModel.numberOfLines < 6
                            ? FiveLinesPicker(
                                resistorModel: state.resistorModel,
                                lineIndex: lineIndex,
                              )
                            : SixLinesPicker(
                                resistorModel: state.resistorModel,
                                lineIndex: lineIndex,
                              ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
