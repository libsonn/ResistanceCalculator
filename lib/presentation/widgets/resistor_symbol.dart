import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resistance_calculator/logic/bloc/resistance_calculator_bloc.dart';

class ResistorSymbol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        color: Colors.amber,
      ),
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      height: 30.0,
      width: 100.0,
      child: BlocBuilder<ResistanceCalculatorBloc, ResistanceCalculatorState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.resistorModel.numberOfLines,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    height: 35.0,
                    width: 10.0,
                    color: state
                        .resistorModel.listOfSelectedLines[index].lineColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
