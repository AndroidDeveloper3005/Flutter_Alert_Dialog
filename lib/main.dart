import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      home: new MyApp()
  ));
}

enum MyDialogAction {
  yes,
  no,
  maybe
}

class MyApp extends StatefulWidget{
  @override
  MyState createState() => new MyState();

}

class MyState extends State<MyApp>{
  String _text ="";

  void _onChange(String value){
    setState(() {
      _text = value;
    });
  }



  void _dialogResult(MyDialogAction value){
    print("Yes Selected $value");
    Navigator.pop(context);
    //Switch on Value
  }

  void _showAlert(String value){
    if(value.isEmpty)return;
    AlertDialog  dialog = new AlertDialog(
      content: new Text(value,
      style: new TextStyle(fontSize: 30.0),
      ),
      actions: <Widget>[
        new FlatButton(onPressed: (){_dialogResult(MyDialogAction.yes);}, child: new Text("Yes")),
        new FlatButton(onPressed: (){_dialogResult(MyDialogAction.no);}, child: new Text("No")),
        new FlatButton(onPressed: (){_dialogResult(MyDialogAction.maybe);}, child: new Text("Maybe")),

      ],

    );
    showDialog(context: context,child: dialog);

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Alert Dialog"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(onChanged: (String value){
                _onChange(value);
              }),
              new RaisedButton(onPressed: (){
                _showAlert(_text);
              },
                child: new Text("Alert Dailog"),
              )
            ],
          ),
        ),
      ),
    );
  }

}
