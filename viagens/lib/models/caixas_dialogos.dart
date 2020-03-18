import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//CAIXA DE DIALOGO MENU
AlertaSair(BuildContext context) {
  Widget BotaoCancelar = FlatButton(
      child: Text('Cancelar'),
      onPressed: () {
        Navigator.of(context).pop(); //FECHA BOX DIALOGO
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
    child: Text('Deletar',),
    color: Colors.red[400],
    onPressed: () {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Viagem Removida!"),
          duration: Duration(seconds: 3),
        ),
      );
      Navigator.of(context).pop();
      print('apertou deletar');
    },
  );
  Widget BotaoCance = FlatButton(
    onPressed: () {
    },
    child: Text('Cancelar'),
    textColor: Colors.grey,
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

//CAIXA DIALOGO INFO
Info(BuildContext context) {
  Widget botOK = FlatButton(
    textColor: Colors.grey[600],
    child: Text('ok'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    content: Text(
      'Versão 0.0.1 \nDesenvolvedor Covid-19 \nYear 2020',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey[600],
        fontStyle: FontStyle.italic,
      ),
    ),
    actions: <Widget>[
      botOK,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
