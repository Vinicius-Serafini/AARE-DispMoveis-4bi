import 'package:AARE/screens/addAgendamento.dart';
import 'package:flutter/material.dart';


import 'screens/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {

    var routes = <String, WidgetBuilder>{
      AddAgendamento.routeName: (BuildContext context) => new AddAgendamento(title: "Adicionar Agendamento"),
    };
    

    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primaryColor: Colors.cyan[400]
      ),
      routes: routes,
      home: HomePage(title: 'AARE - Vinicius')
    );
  }
}
