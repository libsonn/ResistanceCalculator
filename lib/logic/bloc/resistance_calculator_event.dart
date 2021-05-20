part of 'resistance_calculator_bloc.dart';

abstract class ResistanceCalculatorEvent extends Equatable {
  const ResistanceCalculatorEvent();

  @override
  List<Object> get props => [];
}

class AddLine extends ResistanceCalculatorEvent {
  AddLine();
}

class RemoveLine extends ResistanceCalculatorEvent {
  RemoveLine();
}

class SelectLine extends ResistanceCalculatorEvent {
  final int numberOfLine;
  final Line selectedLine;

  SelectLine({@required this.numberOfLine, @required this.selectedLine});
}
