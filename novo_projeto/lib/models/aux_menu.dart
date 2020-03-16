import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novo_projeto/screen/Formulario.dart';
import 'package:novo_projeto/screen/Lista.dart';

import 'Viagens.dart';


class ConfigLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lista(context);
  }
}

Widget Lista(BuildContext context) { //LISTA DE CONFIGURAÇÕES
  return ListView(
    children: <Widget>[
      /* Card(
        child: ListTile(
          leading: Icon(Icons.delete),
          title: Text('Excluir item'),
          onTap: () {
            debugPrint('EXCLUIR ITEM');
            final Future<VarViagem> future = Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Viagens();
                },
              ),
            );

          },
        ),
      ),*/
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

AlertaSair(BuildContext context) {  //CAIXA DE DIALOGO
  Widget BotaoCancelar = FlatButton(
      child: Text('cancelar'),
      onPressed: () {
        Navigator.of(context).pop();
      });
  Widget BotaoOk = FlatButton(
    onPressed: () {
      exit(0);
    },
    child: Text('ok'),
  );
  AlertDialog alert = AlertDialog(
    content: Text('Deseja realmente sair?'),
    actions: <Widget>[BotaoCancelar, BotaoOk],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

DeleteItem(BuildContext context) {  //CAIXA DE DIALOGO
  Widget BotaoDeletar = FlatButton(
      child: Text('Deletar'),
      onPressed: () {




      });
  Widget BotaoCance = FlatButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: Text('Cancelar'),
  );
  AlertDialog alert = AlertDialog(
    content: Text('Deletar este item?'),
    actions: <Widget>[BotaoDeletar, BotaoCance],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}