import 'package:flutter/material.dart';

import 'Screen/Add_Screen.dart';
import 'Screen/Home_Screen.dart';
import 'inherited_widgets/note_inherited_widgets.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget(
      MaterialApp(
        routes: {
          '/': (context) => Home_Screen(),
          '/Editing': (context) => Add_Screen(NoteMode.Editing, 0),
          '/Adding': (context) => Add_Screen(NoteMode.Adding, 0),
        },
      ),
    );
  }
}
