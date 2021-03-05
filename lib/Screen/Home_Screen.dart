
import 'package:flutter/material.dart';
import 'package:keep_accounts_app/inherited_widgets/note_inherited_widgets.dart';


class Home_Screen extends StatefulWidget {

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  List<Map<String, String>> get _Notes => NoteInheritedWidget.of(context).notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('記帳記事本'),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.popAndPushNamed(context, '/Editing');
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _Data(_Notes[index]['Data']),
                    Container(height: 4,),
                    _Money(_Notes[index]['Money']),
                    _Number(_Notes[index]['Number']),
                    _Plus_Cost(_Notes[index]['Plus']),
                  ],
                ),
            ),
              );
          },
        itemCount: _Notes.length,
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, '/Adding');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _Data extends StatelessWidget {
  final String _text;
  _Data(this._text);

  @override
  Widget build(BuildContext context) {
    return Text (
      _text,
      style: TextStyle(
        fontSize: 15,
        fontWeight:  FontWeight.bold,
        color: Colors.black26,
      ),
    );
  }
}

class _Number extends StatelessWidget {
  final String _text;
  _Number(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        fontSize: 20,
        fontWeight:  FontWeight.bold,
        color: Colors.deepOrange,
      ),
    );
  }
}

class _Money extends StatelessWidget {
  final String _text;
  _Money(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
        _text,
        style: TextStyle(
          fontSize: 25,
          fontWeight:  FontWeight.normal,
          color: Colors.black,
        )

    );
  }
}

class _Plus_Cost extends StatelessWidget {
  final String _text;
  _Plus_Cost(this._text);


  @override
  Widget build(BuildContext context) {
    return Text(
        _text,
        style: TextStyle(
          fontSize: 25,
          fontWeight:  FontWeight.normal,
          color: Colors.black,
        )
    );
  }
}



