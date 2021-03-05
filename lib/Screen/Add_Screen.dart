import 'package:flutter/material.dart';
import 'package:keep_accounts_app/inherited_widgets/note_inherited_widgets.dart';

enum NoteMode {
  Editing,
  Adding
}


class Add_Screen extends StatefulWidget {
  final NoteMode _noteMode;
  final int index;

  Add_Screen(this._noteMode, this.index);

  @override
  _Add_ScreenState createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {

  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _moneyController = TextEditingController();
  final TextEditingController _plusController = TextEditingController();

  List<Map<String, String>> get _Notes => NoteInheritedWidget.of(context).notes;

  @override
  void didChangeDependencies() {
    if(widget._noteMode == NoteMode.Editing){
      _dataController.text = _Notes[widget.index]["Data"];
      _moneyController.text = _Notes[widget.index]["Money"];
      _numberController.text = _Notes[widget.index]["Number"];
      _plusController.text = _Notes[widget.index]["Plus"];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.chevron_left),
          onPressed: () => Navigator.popAndPushNamed(context, '/'),
        ),
        title: Text(
            widget._noteMode == NoteMode.Adding ? '增加選單' : '編輯'
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _dataController,
              decoration: InputDecoration(
                hintText: 'Data',
              ),
            ),
            TextField(
              controller: _numberController,
              decoration: InputDecoration(
                hintText: '代碼',
              ),
            ),
            TextField(
              controller: _moneyController,
              decoration: InputDecoration(
                hintText: '金額',
              ),
            ),
            TextField(
              controller: _plusController,
              decoration: InputDecoration(
                hintText: '+ or -',
              ),
            ),
            Container(height: 4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteButton('保存', Colors.blue, (){
                  final data = _dataController.text;
                  final number = _numberController.text;
                  final money = _moneyController.text;
                  final plus = _plusController.text;
                  if (widget?._noteMode == NoteMode.Adding){
                    _Notes.add({
                      'Data' : data,
                      'Money': money,
                      'Number': number,
                      'Plus': plus,
                    });
                  }else if ( widget?._noteMode == NoteMode.Editing){
                    _Notes[widget.index] = {
                      'Data' : data,
                      'Money': money,
                      'Number': number,
                      'Plus': plus,
                    };
                  }
                  Navigator.popAndPushNamed(context, '/');

                }),
                Container(height: 16.0,),
                _NoteButton('xxx', Colors.grey, (){
                  Navigator.popAndPushNamed(context, '/');
                }),
                widget._noteMode == NoteMode.Editing ?
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _NoteButton('刪除', Colors.red, (){
                    _Notes.removeAt(widget.index);
                    Navigator.popAndPushNamed(context, '/');
                  }),
                ) : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text , this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(color: Colors.white),
      ),
      height: 50,
      minWidth: 100,
      color: _color,
    );
  }
}

