import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddAgendamento extends StatefulWidget {
  AddAgendamento({Key key, this.title}) : super(key: key);

  static const String routeName = "/AddAgendamento";

  final String title;

  @override
  _AddAgendamentoState createState() => new _AddAgendamentoState();
}

class _AddAgendamentoState extends State<AddAgendamento> {

  String _date = "informar a data";
  String _time = "informar o horário";

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: new Container(
          child: new Column(
            children: <Widget>[
              TextFormField(
              decoration: const InputDecoration(
              hintText: 'Informe o nome do Paciente',
              icon: Icon(Icons.person_add),
              labelText: "Nome do Paciente"
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, digite o nome do paciente';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              hintText: 'Informe o telefone para contato',
              icon: Icon(Icons.phone),
              labelText: "Telefone para contato"
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, digite o telefone do Paciente';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Informe o Médico da consulta',
              icon: Icon(Icons.medical_services),
              labelText: 'Médico da consulta'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, digite Médico da consulta';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Informe o email do Paciente',
              icon: Icon(Icons.mail),
              labelText: 'Email do paciente'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, informe o email';
              }
              return value.contains('@') ? null : 'O email deve possuir @';
            },
          ),
          RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                    print('confirm $date');
                    _date = '${date.year} - ${date.month} - ${date.day}';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                Text(
                                  " $_date",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showTimePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true, onConfirm: (time) {
                    print('confirm $time');
                    _time = '${time.hour} : ${time.minute} : ${time.second}';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.access_time,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                Text(
                                  " $_time",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              )
          ],
          ),
        ),
      )
    );
    
  }
  void _onButtonPressed() {
    Navigator.pop(context);
  }
}