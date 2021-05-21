part of 'resistance_calculator_bloc.dart';

abstract class ResistanceCalculatorState extends Equatable {
  final ResistorModel resistorModel;

  ResistanceCalculatorState({@required this.resistorModel});

  @override
  List<Object> get props => [resistorModel];
}

class ResistanceCalculatorInitial extends ResistanceCalculatorState {
  final ResistorModel resistorModel;
  ResistanceCalculatorInitial({@required this.resistorModel})
      : super(resistorModel: ResistorModel());

  @override
  List<Object> get props => [resistorModel];
}

class ChangedValuesState extends ResistanceCalculatorState {
  final ResistorModel resistorModel;

  ChangedValuesState({@required this.resistorModel})
      : super(resistorModel: resistorModel);
  @override
  List<Object> get props => [resistorModel];
}
