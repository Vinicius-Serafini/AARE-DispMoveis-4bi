import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/Agendamento.dart';

import './AddAgendamento.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage>{

  List<Agendamento> agendamentos;

  var agendamento = new Agendamento('Vinicius', new DateTime.now(), "Médico massa", "(45) 9 9999-9999", "Vinicius@email.com");

  void _goToAddAgendamentoActivity() {
    
    Navigator.pushNamed(context, AddAgendamento.routeName);

  }
  
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _criaListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddAgendamentoActivity,
        tooltip: 'Adicionar novo Agendamento',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _criaListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: agendamentos == null ? 0 : agendamentos.length,
      itemBuilder: (context, index) {
        return _criaLinha(agendamentos[index]);
      },
    );
  }

  Widget _criaLinha(dynamic agendamento) {

    final DateFormat formatter = DateFormat('dd-MM-yyyy H:m');
    
    return ListTile(
      title: Text("Paciente: ${agendamento.nome}"),
      subtitle: Text(
      "Horário: ${formatter.format(agendamento.horario).toString()}\n" + 
      "Medico: ${agendamento.medico}\n" +
      "Celular: ${agendamento.celular}\n"),
    );
  }
  
  @override
  void initState(){
    super.initState();
    agendamentos = [agendamento, agendamento, agendamento, agendamento, agendamento, agendamento];
  }

}
