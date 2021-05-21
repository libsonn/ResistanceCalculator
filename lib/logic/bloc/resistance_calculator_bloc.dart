import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:resistance_calculator/constants.dart';
import 'package:resistance_calculator/logic/calculation_logic.dart';
import 'package:resistance_calculator/logic/line_model.dart';
import 'package:resistance_calculator/logic/resistor_model.dart';

part 'resistance_calculator_event.dart';
part 'resistance_calculator_state.dart';

class ResistanceCalculatorBloc
    extends Bloc<ResistanceCalculatorEvent, ResistanceCalculatorState> {
  final CalculationLogic calculationLogic;
  ResistanceCalculatorBloc({@required this.calculationLogic})
      : super(
          ResistanceCalculatorInitial(
            resistorModel: new ResistorModel(
              numberOfLines: 3,
              listOfSelectedLines: [
                listOfFiveLines[4],
                listOfFiveLines[3],
                listOfFiveLines[3],
                listOfFiveLines[1],
                listOfFiveLines[0],
                listOfFiveLines[3]
              ],
            ),
          ),
        );

  @override
  Stream<ResistanceCalculatorState> mapEventToState(
    ResistanceCalculatorEvent event,
  ) async* {
    if (event is AddLine) {
      yield* mapAddLine(event);
    }
    if (event is RemoveLine) {
      yield* mapRemoveLine(event);
    }
    if (event is SelectLine) {
      yield* mapSelectLine(event);
    }
  }

  Stream<ResistanceCalculatorState> mapAddLine(
    AddLine event,
  ) async* {
    ResistorModel resistorModel;
    if (state.resistorModel.numberOfLines < 6) {
      resistorModel = state.resistorModel
          .copyWith(numberOfLines: state.resistorModel.numberOfLines + 1);
      resistorModel =
          calculationLogic.calculateResistance(resistor: resistorModel);
      yield ChangedValuesState(resistorModel: resistorModel);
    }
  }

  Stream<ResistanceCalculatorState> mapRemoveLine(
    RemoveLine event,
  ) async* {
    ResistorModel resistorModel;
    if (state.resistorModel.numberOfLines > 3) {
      resistorModel = state.resistorModel
          .copyWith(numberOfLines: state.resistorModel.numberOfLines - 1);

      resistorModel =
          calculationLogic.calculateResistance(resistor: resistorModel);

      yield ChangedValuesState(resistorModel: resistorModel);
    }
  }

  Stream<ResistanceCalculatorState> mapSelectLine(
    SelectLine event,
  ) async* {
    ResistorModel resistorModel;
    List<Line> listOfSelectedLines = state.resistorModel.listOfSelectedLines;
    listOfSelectedLines[event.numberOfLine] = event.selectedLine;
    resistorModel =
        state.resistorModel.copyWith(listOfSelectedLines: listOfSelectedLines);

    resistorModel =
        calculationLogic.calculateResistance(resistor: resistorModel);

    yield ChangedValuesState(resistorModel: resistorModel);
  }
}
