import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novo_projeto/screen/Lista.dart';

//CAIXA DE DIALOGO MENU
AlertaSair(BuildContext context) {
  Widget BotaoCancelar = FlatButton(
      child: Text('Cancelar'),
      onPressed: () {
        Navigator.of(context).pop(); //FECHA DIALOGO
      });
  Widget BotaoOk = FlatButton(
    onPressed: () {
      exit(0);
    },
    child: Text('Ok'),
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

//CAIXA DE DIALOGO - DELETAR
DeleteItem(BuildContext context) {
  Widget BotaoDeletar = FlatButton(
      child: Text('Deletar'),
      onPressed: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Viagem Removida!"),
            duration: Duration(seconds: 4),
          ),
        );
        Navigator.of(context).pop();
        print('apertou deletar');
      });
  Widget BotaoCance = FlatButton(
    onPressed: () {

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
