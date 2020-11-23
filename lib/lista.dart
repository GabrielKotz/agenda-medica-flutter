import 'package:flutter/material.dart';
import 'dart:math';

class Lista extends StatefulWidget {
  final String text;

  Lista({Key key, @required this.text}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
   
class _HomeState extends State<Lista>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Pacientes"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:  ListView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          
      children: <Widget>[               
        Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            ListTile(
              title: Text('Nome: michel jordan', style: TextStyle(color: Colors.black, fontSize: 20.0)),
            ),        
            ListTile(
              title: Text('Data: 10/10/20', style: TextStyle(color: Colors.black, fontSize: 20.0)),
            ),
            ListTile(
              title: Text('Hora: 20:30', style: TextStyle(color: Colors.black, fontSize: 20.0)),
            ),
            ListTile(
              title: Text('Medico: Carlinhos', style: TextStyle(color: Colors.black, fontSize: 20.0)),
            ),
            ListTile(
              title: Text('Telefone: (45)9906-1045', style: TextStyle(color: Colors.black, fontSize: 20.0)),
            ),
            ListTile(
              title: Text('Email: jordan@gmail.com', style: TextStyle(color: Colors.black, fontSize: 20.0)),
            ),
            ],
            ),
          ],
      ),
    );
  }
}