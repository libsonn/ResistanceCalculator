import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resistance_calculator/constants.dart';
import 'package:resistance_calculator/logic/bloc/resistance_calculator_bloc.dart';

class NumberOfLinesPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Column(
        children: [
          Text(
            'Number of lines:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: kLightBlueColor,
            ),
          ),
          SizedBox(
            height: 3.0,
          ),
          BlocBuilder<ResistanceCalculatorBloc, ResistanceCalculatorState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                      color: kLightBlueColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      color: kDarkBlueColor,
                      iconSize: 40.0,
                      icon: Icon(
                        Icons.remove,
                      ),
                      onPressed: () {
                        BlocProvider.of<ResistanceCalculatorBloc>(context)
                            .add(RemoveLine());
                      },
                    ),
                  ),
                  Text(
                    state.resistorModel.numberOfLines.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kLightBlueColor,
                    ),
                  ),
                  Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                      color: kLightBlueColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      color: kDarkBlueColor,
                      iconSize: 40.0,
                      icon: Icon(
                        Icons.add,
                      ),
                      onPressed: () {
                        BlocProvider.of<ResistanceCalculatorBloc>(context)
                            .add(AddLine());
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
