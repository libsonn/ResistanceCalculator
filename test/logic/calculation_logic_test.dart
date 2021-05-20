import 'package:flutter_test/flutter_test.dart';
import 'package:resistance_calculator/constants.dart';
import 'package:resistance_calculator/logic/calculation_logic.dart';
import 'package:resistance_calculator/logic/resistor_model.dart';

void main() {
  group('check if resistance is counted properly', () {
    test('calculate results for resistor with 3 lines', () {
      CalculationLogic _calculationLogic = CalculationLogic();
      ResistorModel _resistorModel;
      //(5*10 + 6*1) * 1000
      _resistorModel = ResistorModel(numberOfLines: 3, listOfSelectedLines: [
        listOfWikiLines[8],
        listOfWikiLines[9],
        listOfWikiLines[5]
      ]);
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .resistanceValue,
          5600);

      //(1*10 + 0*1) * 10000
      _resistorModel = ResistorModel(numberOfLines: 3, listOfSelectedLines: [
        listOfWikiLines[4],
        listOfWikiLines[3],
        listOfWikiLines[6]
      ]);
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .resistanceValue,
          10000);

      //(9*10 + 9*1) * 100
      _resistorModel = ResistorModel(numberOfLines: 3, listOfSelectedLines: [
        listOfWikiLines[12],
        listOfWikiLines[12],
        listOfWikiLines[5]
      ]);
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .resistanceValue,
          9900);
      //(3*10 + 4*1) * 100000000
      _resistorModel = ResistorModel(numberOfLines: 3, listOfSelectedLines: [
        listOfWikiLines[6],
        listOfWikiLines[7],
        listOfWikiLines[11]
      ]);
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .resistanceValue,
          3400000000);
    });
    test('add 4 line to calculate tolerance', () {
      CalculationLogic _calculationLogic = CalculationLogic();
      ResistorModel _resistorModel;

      _resistorModel = ResistorModel(numberOfLines: 4, listOfSelectedLines: [
        listOfWikiLines[8],
        listOfWikiLines[9],
        listOfWikiLines[5],
        listOfWikiLines[1],
      ]);
      //Tolerance = 10
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .tolerance,
          10.0);

      _resistorModel = ResistorModel(numberOfLines: 4, listOfSelectedLines: [
        listOfWikiLines[4],
        listOfWikiLines[3],
        listOfWikiLines[6],
        listOfWikiLines[10],
      ]);
      //Tolerance = 0.1
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .tolerance,
          0.1);

      _resistorModel = ResistorModel(numberOfLines: 4, listOfSelectedLines: [
        listOfWikiLines[12],
        listOfWikiLines[12],
        listOfWikiLines[5],
        listOfWikiLines[5],
      ]);
      //Tolerance = 2.00
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .tolerance,
          2);

      _resistorModel = ResistorModel(numberOfLines: 4, listOfSelectedLines: [
        listOfWikiLines[6],
        listOfWikiLines[7],
        listOfWikiLines[11],
        listOfWikiLines[3]
      ]);
      //Tolerance = 20
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .tolerance,
          20);
    });
    test('add 5 line to calculate temperature rate', () {
      CalculationLogic _calculationLogic = CalculationLogic();
      ResistorModel _resistorModel;

      _resistorModel = ResistorModel(numberOfLines: 5, listOfSelectedLines: [
        listOfWikiLines[8],
        listOfWikiLines[9],
        listOfWikiLines[5],
        listOfWikiLines[1],
        listOfWikiLines[4],
      ]);
      //Temperature rate = 100
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .temperatureRate,
          100);

      _resistorModel = ResistorModel(numberOfLines: 5, listOfSelectedLines: [
        listOfWikiLines[4],
        listOfWikiLines[3],
        listOfWikiLines[6],
        listOfWikiLines[10],
        listOfWikiLines[11],
      ]);
      //Temperature rate = 2
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .temperatureRate,
          2);

      _resistorModel = ResistorModel(numberOfLines: 5, listOfSelectedLines: [
        listOfWikiLines[12],
        listOfWikiLines[12],
        listOfWikiLines[5],
        listOfWikiLines[5],
        listOfWikiLines[1],
      ]);
      //Temperature rate = 0
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .temperatureRate,
          0);

      _resistorModel = ResistorModel(numberOfLines: 5, listOfSelectedLines: [
        listOfWikiLines[6],
        listOfWikiLines[7],
        listOfWikiLines[11],
        listOfWikiLines[3],
        listOfWikiLines[8],
      ]);
      //Temperature rate = 20
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .temperatureRate,
          20);
    });
  });
}
