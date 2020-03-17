import 'package:flutter/material.dart';
import 'package:novo_projeto/models/Viagens.dart';
import 'package:novo_projeto/models/caixas_dialogos.dart';

import 'Lista.dart';

const _titleAppBarConfig = 'Configurações';

class ConfigLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lista(context);
  }
}

//LISTA DE CONFIGURAÇÕES
Widget Lista(BuildContext context) {
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
            }),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.info),
          title: Text('Info'),
          subtitle: Text('Informações sobre o app'),
          onTap: () {
            Info(context);
          },
        ),
      ),
    ],
  );
}



//PAGINA CONFIGURAÇOES
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
