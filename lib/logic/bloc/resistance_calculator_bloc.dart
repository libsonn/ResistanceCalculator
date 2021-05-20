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
  CalculationLogic _calculationLogic = CalculationLogic();

  ResistanceCalculatorBloc() : super(ResistanceCalculatorInitial());

  @override
  Stream<ResistanceCalculatorState> mapEventToState(
    ResistanceCalculatorEvent event,
  ) async* {
    if (event is AddLine) {
      ResistorModel resistorModel;
      if (state.resistorModel.numberOfLines < 5) {
        resistorModel = state.resistorModel
            .copyWith(numberOfLines: state.resistorModel.numberOfLines + 1);
        resistorModel =
            _calculationLogic.calculateResistance(resistor: resistorModel);
        yield ChangedValuesState(resistorModel: resistorModel);
      }
    }
    if (event is RemoveLine) {
      ResistorModel resistorModel;
      if (state.resistorModel.numberOfLines > 3) {
        resistorModel = state.resistorModel
            .copyWith(numberOfLines: state.resistorModel.numberOfLines - 1);

        resistorModel =
            _calculationLogic.calculateResistance(resistor: resistorModel);

        yield ChangedValuesState(resistorModel: resistorModel);
      }
    }
    if (event is SelectLine) {
      ResistorModel resistorModel;
      List<Line> listOfSelectedLines = state.resistorModel.listOfSelectedLines;
      listOfSelectedLines[event.numberOfLine] = event.selectedLine;
      resistorModel = state.resistorModel
          .copyWith(listOfSelectedLines: listOfSelectedLines);

      resistorModel =
          _calculationLogic.calculateResistance(resistor: resistorModel);
      yield ChangedValuesState(resistorModel: resistorModel);
    }
  }
}
