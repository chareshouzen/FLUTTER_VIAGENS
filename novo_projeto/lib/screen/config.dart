import 'package:flutter/material.dart';
import 'package:novo_projeto/models/aux_menu.dart';

const _titleAppBarConfig = 'Configurações';

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

