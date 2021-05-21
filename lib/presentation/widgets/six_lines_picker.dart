import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resistance_calculator/constants.dart';
import 'package:resistance_calculator/logic/bloc/resistance_calculator_bloc.dart';
import 'package:resistance_calculator/logic/resistor_model.dart';

class SixLinesPicker extends StatelessWidget {
  const SixLinesPicker(
      {@required this.lineIndex, @required this.resistorModel});

  final int lineIndex;
  final ResistorModel resistorModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfSixLines.length,
      itemBuilder: (context, index) {
        return listOfSixLines[index].avilableOnLines.contains(lineIndex + 1)
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      child: ListTile(
                        selectedTileColor: kSelectedItemColor,
                        selected: resistorModel
                                .listOfSelectedLines[lineIndex].numberOfLine ==
                            index,
                        onTap: () {
                          BlocProvider.of<ResistanceCalculatorBloc>(context)
                              .add(
                            SelectLine(
                              numberOfLine: lineIndex,
                              selectedLine: listOfSixLines[index],
                            ),
                          );
                        },
                        tileColor: kLightBlueColor,
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: 5.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              color: listOfSixLines[index].lineColor,
                            ),
                          ),
                        ),
                        title: Text(
                          listOfSixLines[index].toString(),
                          softWrap: true,
                          style:
                              TextStyle(color: kDarkBlueColor, fontSize: 12.0),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container();
      },
    );
  }
}
