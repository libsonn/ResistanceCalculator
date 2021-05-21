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
        listOfFiveLines[8],
        listOfFiveLines[9],
        listOfFiveLines[5]
      ]);
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .resistanceValue,
          5600);

      //(1*10 + 0*1) * 10000
      _resistorModel = ResistorModel(numberOfLines: 3, listOfSelectedLines: [
        listOfFiveLines[4],
        listOfFiveLines[3],
        listOfFiveLines[6]
      ]);
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .resistanceValue,
          10000);

      //(9*10 + 9*1) * 100
      _resistorModel = ResistorModel(numberOfLines: 3, listOfSelectedLines: [
        listOfFiveLines[12],
        listOfFiveLines[12],
        listOfFiveLines[5]
      ]);
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .resistanceValue,
          9900);
      //(3*10 + 4*1) * 100000000
      _resistorModel = ResistorModel(numberOfLines: 3, listOfSelectedLines: [
        listOfFiveLines[6],
        listOfFiveLines[7],
        listOfFiveLines[11]
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
        listOfFiveLines[8],
        listOfFiveLines[9],
        listOfFiveLines[5],
        listOfFiveLines[1],
      ]);
      //Tolerance = 10
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .tolerance,
          10.0);

      _resistorModel = ResistorModel(numberOfLines: 4, listOfSelectedLines: [
        listOfFiveLines[4],
        listOfFiveLines[3],
        listOfFiveLines[6],
        listOfFiveLines[10],
      ]);
      //Tolerance = 0.1
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .tolerance,
          0.1);

      _resistorModel = ResistorModel(numberOfLines: 4, listOfSelectedLines: [
        listOfFiveLines[12],
        listOfFiveLines[12],
        listOfFiveLines[5],
        listOfFiveLines[5],
      ]);
      //Tolerance = 2.00
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .tolerance,
          2);

      _resistorModel = ResistorModel(numberOfLines: 4, listOfSelectedLines: [
        listOfFiveLines[6],
        listOfFiveLines[7],
        listOfFiveLines[11],
        listOfFiveLines[3]
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
        listOfFiveLines[8],
        listOfFiveLines[9],
        listOfFiveLines[5],
        listOfFiveLines[1],
        listOfFiveLines[4],
      ]);
      //Temperature rate = 100
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .temperatureRate,
          100);

      _resistorModel = ResistorModel(numberOfLines: 5, listOfSelectedLines: [
        listOfFiveLines[4],
        listOfFiveLines[3],
        listOfFiveLines[6],
        listOfFiveLines[10],
        listOfFiveLines[11],
      ]);
      //Temperature rate = 2
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .temperatureRate,
          2);

      _resistorModel = ResistorModel(numberOfLines: 5, listOfSelectedLines: [
        listOfFiveLines[12],
        listOfFiveLines[12],
        listOfFiveLines[5],
        listOfFiveLines[5],
        listOfFiveLines[1],
      ]);
      //Temperature rate = 0
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .temperatureRate,
          0);

      _resistorModel = ResistorModel(numberOfLines: 5, listOfSelectedLines: [
        listOfFiveLines[6],
        listOfFiveLines[7],
        listOfFiveLines[11],
        listOfFiveLines[3],
        listOfFiveLines[8],
      ]);
      //Temperature rate = 20
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .temperatureRate,
          20);
    });
    test('Calculate values for 6 lines', () {
      CalculationLogic _calculationLogic = CalculationLogic();
      ResistorModel _resistorModel;

      _resistorModel = ResistorModel(numberOfLines: 6, listOfSelectedLines: [
        listOfSixLines[8],
        listOfSixLines[9],
        listOfSixLines[9],
        listOfSixLines[5],
        listOfSixLines[10],
        listOfSixLines[9],
      ]);

      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .resistanceValue,
          5660);
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .tolerance,
          0.1);
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .temperatureRate,
          10);

      _resistorModel = ResistorModel(numberOfLines: 6, listOfSelectedLines: [
        listOfSixLines[4],
        listOfSixLines[6],
        listOfSixLines[10],
        listOfSixLines[3],
        listOfSixLines[0],
        listOfSixLines[3],
      ]);

      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .resistanceValue,
          13.7);
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .tolerance,
          20);
      expect(
          _calculationLogic
              .calculateResistance(resistor: _resistorModel)
              .temperatureRate,
          250);
    });
  });
}
