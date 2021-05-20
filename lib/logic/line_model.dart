import 'package:flutter/material.dart';

class Line {
  final int numberOfLine;
  final Color lineColor;
  final int firstLineValue;
  final int secondLineValue;
  final double multiplier;
  final double tolerance;
  final int temperatureRate;
  final List<int> avilableOnLines;

  Line({
    @required this.numberOfLine,
    @required this.lineColor,
    this.firstLineValue,
    this.secondLineValue,
    this.multiplier,
    this.tolerance,
    this.temperatureRate,
    @required this.avilableOnLines,
  });

  @override
  String toString() {
    String _firstLineValue = firstLineValue != null
        ? 'First line value: ' + firstLineValue.toString() + ', '
        : '';
    String _secondLineValue = secondLineValue != null
        ? 'Second line value: ' + secondLineValue.toString() + ', '
        : '';
    String _multiplier = multiplier != null
        ? ' Multiplier: ' + multiplier.toString() + ', '
        : '';
    String _tolerance =
        tolerance != null ? ' Tolerance: ' + tolerance.toString() + ', ' : '';
    String _temperatureRate = temperatureRate != null
        ? ' Temperature rate: ' + temperatureRate.toString()
        : '';

    return _firstLineValue +
        _secondLineValue +
        _multiplier +
        _tolerance +
        _temperatureRate;
  }
}
