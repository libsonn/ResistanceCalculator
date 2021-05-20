import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resistance_calculator/constants.dart';
import 'package:resistance_calculator/logic/bloc/resistance_calculator_bloc.dart';

class LinesPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 500.0,
            minHeight: 40.0,
            maxWidth: 350.0,
          ),
          child:
              BlocBuilder<ResistanceCalculatorBloc, ResistanceCalculatorState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.resistorModel.numberOfLines,
                itemBuilder: (context, lineIndex) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Number of line: ${lineIndex + 1}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kLightBlueColor,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 300.0,
                          minHeight: 40.0,
                          maxWidth: 350.0,
                        ),
                        child: ListView.builder(
                          itemCount: listOfWikiLines.length,
                          itemBuilder: (context, index) {
                            return listOfWikiLines[index]
                                    .avilableOnLines
                                    .contains(lineIndex + 1)
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30.0),
                                          ),
                                          child: ListTile(
                                            selectedTileColor:
                                                kSelectedItemColor,
                                            selected: state
                                                    .resistorModel
                                                    .listOfSelectedLines[
                                                        lineIndex]
                                                    .numberOfLine ==
                                                index,
                                            onTap: () {
                                              BlocProvider.of<
                                                          ResistanceCalculatorBloc>(
                                                      context)
                                                  .add(
                                                SelectLine(
                                                  numberOfLine: lineIndex,
                                                  selectedLine:
                                                      listOfWikiLines[index],
                                                ),
                                              );
                                            },
                                            tileColor: kLightBlueColor,
                                            leading: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Container(
                                                width: 5.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(15.0),
                                                  ),
                                                  color: listOfWikiLines[index]
                                                      .lineColor,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              listOfWikiLines[index].toString(),
                                              softWrap: true,
                                              style: TextStyle(
                                                  color: kDarkBlueColor,
                                                  fontSize: 12.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container();
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
