import 'package:resistance_calculator/logic/line_model.dart';

class ResistorModel {
  final int numberOfLines;
  List<Line> listOfSelectedLines;
  final double resistanceValue;
  final double tolerance;
  final int temperatureRate;

  ResistorModel({
    this.numberOfLines = 0,
    this.listOfSelectedLines,
    this.resistanceValue = 0.0,
    this.tolerance = 20.0,
    this.temperatureRate = 0,
  });
  ResistorModel copyWith({
    int numberOfLines,
    List<Line> listOfSelectedLines,
    double resistanceValue,
    double tolerance,
    int temperatureRate,
  }) {
    return ResistorModel(
      numberOfLines: numberOfLines ?? this.numberOfLines,
      listOfSelectedLines: listOfSelectedLines ?? this.listOfSelectedLines,
      resistanceValue: resistanceValue ?? this.resistanceValue,
      tolerance: tolerance ?? this.tolerance,
      temperatureRate: temperatureRate ?? this.temperatureRate,
    );
  }

  @override
  String toString() {
    return 'Resistance value: ' +
        resistanceValue.toStringAsFixed(2) +
        'Ω\n Tolerance: ± ' +
        tolerance.toStringAsFixed(2) +
        '%\n Temperature rate: ±' +
        temperatureRate.toStringAsFixed(2) +
        ' ppm/K';
  }
}
