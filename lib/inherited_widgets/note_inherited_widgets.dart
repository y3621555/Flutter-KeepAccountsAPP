import 'package:flutter/material.dart';

class NoteInheritedWidget extends InheritedWidget{

  final notes = [
    {
      'Data': '21',
      'Money': 'Money',
      'Number': 'Number',
      'Plus': 'Plus',
    },
    {
      'Data': '22',
      'Money': 'Money',
      'Number': 'Number',
      'Plus': 'Plus',
    },
    {
      'Data': '23',
      'Money': 'Money',
      'Number': 'Number',
      'Plus': 'Plus',
    }
  ];

  NoteInheritedWidget(Widget child) : super(child: child);


  static NoteInheritedWidget of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(NoteInheritedWidget)as NoteInheritedWidget);
  }
  @override
  bool updateShouldNotify( NoteInheritedWidget oldWidget){
    return oldWidget.notes != notes;
  }
}