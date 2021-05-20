import 'package:resistance_calculator/logic/resistor_model.dart';

class CalculationLogic {
  ResistorModel calculateResistance({ResistorModel resistor}) {
    double _resistance = 0.0;
    double _tolerance = 20;
    int _temperatureRate = 0;

    int _numberOfLines = resistor.numberOfLines;

    switch (_numberOfLines) {
      case 3:
        _resistance = (resistor.listOfSelectedLines[0].firstLineValue * 10 +
                resistor.listOfSelectedLines[1].secondLineValue * 1) *
            resistor.listOfSelectedLines[2].multiplier;
        _tolerance = 20;
        _temperatureRate = 0;
        break;
      case 4:
        _resistance = (resistor.listOfSelectedLines[0].firstLineValue * 10 +
                resistor.listOfSelectedLines[1].secondLineValue * 1) *
            resistor.listOfSelectedLines[2].multiplier;
        _tolerance = resistor.listOfSelectedLines[3].tolerance;
        _temperatureRate = 0;
        break;
      case 5:
        _resistance = (resistor.listOfSelectedLines[0].firstLineValue * 10 +
                resistor.listOfSelectedLines[1].secondLineValue * 1) *
            resistor.listOfSelectedLines[2].multiplier;
        _tolerance = resistor.listOfSelectedLines[3].tolerance;
        _temperatureRate = resistor.listOfSelectedLines[4].temperatureRate;
        break;
    }

    resistor = resistor.copyWith(
      listOfSelectedLines: resistor.listOfSelectedLines,
      resistanceValue: _resistance,
      tolerance: _tolerance,
      temperatureRate: _temperatureRate,
    );

    return resistor;
  }
}
