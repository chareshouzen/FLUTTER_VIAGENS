import 'package:flutter/material.dart';
import 'package:novo_projeto/models/Viagens.dart';

import 'Lista.dart';

const _titleAppBarConfig = 'Configurações';


class ConfigLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lista(context);
  }
}

Widget Lista(BuildContext context) { //LISTA DE CONFIGURAÇÕES
  return ListView(
    children: <Widget>[
      Card(
        child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Editar item'),
            onTap: () {
              debugPrint('EDITAR ITEM');
              final Future<VarViagem> future = Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Viagens();
                  },
                ),
              );
            }
        ),
      ),
    ],
  );
}


class Configuracoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_titleAppBarConfig),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.blueGrey[700], Colors.grey[400]],
            ),
          ),
        ),
      ),
      body: ConfigLista(),
    );
  }
}

