import 'package:flutter/material.dart';
import 'package:novo_projeto/models/Viagens.dart';
import 'package:novo_projeto/models/caixas_dialogos.dart';
import 'package:novo_projeto/screen/config.dart';

import 'Formulario.dart';

class Viagens extends StatefulWidget {
  final List<VarViagem> _viagens = List();

  @override
  State<StatefulWidget> createState() {
    return ViagensState();
  }
}

class ViagensState extends State<Viagens> {
  var _opcoes = [
    "Configurações",
    "Sair",
  ];

  choiceAction(String choice) {
    switch (choice) {
      case "Configurações":
        print("Item escolhido: $choice");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Configuracoes();
            },
          ),
        );
        break;
      case "Sair":
        print("Item escolhido: $choice");
        AlertaSair(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return _opcoes.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
        centerTitle: true,
        title: Text('VIAGENS'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.indigo[700], Colors.purple[100]],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget._viagens.length,
        itemBuilder: (context, indice) {
          final Viagem = widget._viagens[indice];
          return
            ItemViagem(Viagem);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.airplanemode_active,
        ),
        backgroundColor: Colors.indigo[300],
        onPressed: () {
          final Future<VarViagem> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormViagem();
              },
            ),
          );
          future.then(
            (ViagemRecebida) {
              debugPrint('$ViagemRecebida');
              debugPrint('CHEGOU');
              if (ViagemRecebida != null) {
                widget._viagens.add(ViagemRecebida);
              } else {
                Scaffold(
                  body: Text('digite uma informação válida'),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class ItemViagem extends StatelessWidget {
  final VarViagem _viagem;

  ItemViagem(this._viagem);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_viagem.origem.toString()),
        subtitle: Text(_viagem.destino.toString()),
        leading: Icon(Icons.flight),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {

            DeleteItem(context);
          },
          iconSize: 24.00,
        ),
      ),
    );
  }
}
