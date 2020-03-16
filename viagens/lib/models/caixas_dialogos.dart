import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




AlertaSair(BuildContext context) {  //CAIXA DE DIALOGO MENU
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




DeleteItem(BuildContext context) {  //CAIXA DE DIALOGO DELETAR
  Widget BotaoDeletar = FlatButton(
      child: Text('Deletar'),
      onPressed: () {

        print('apertou deletar');

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