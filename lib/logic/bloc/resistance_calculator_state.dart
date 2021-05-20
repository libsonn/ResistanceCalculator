part of 'resistance_calculator_bloc.dart';

abstract class ResistanceCalculatorState extends Equatable {
  final ResistorModel resistorModel;

  ResistanceCalculatorState({@required this.resistorModel});

  @override
  List<Object> get props => [resistorModel];
}

class ResistanceCalculatorInitial extends ResistanceCalculatorState {
  ResistanceCalculatorInitial()
      : super(
          resistorModel: ResistorModel(
            numberOfLines: 3,
            listOfSelectedLines: [
              listOfWikiLines[4],
              listOfWikiLines[3],
              listOfWikiLines[1],
              listOfWikiLines[0],
              listOfWikiLines[3],
            ],
          ),
        );

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
