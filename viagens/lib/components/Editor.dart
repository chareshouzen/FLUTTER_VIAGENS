import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String dica;
  final String rotulo;
  final IconData icone;

  Editor({this.controlador, this.dica, this.rotulo, this.icone});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controlador,
      style: TextStyle(
        color: Colors.deepPurple,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        icon: Icon(icone),
        labelText: rotulo,
        hintText: dica,
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.indigo[400],
        ),
      ),
    );
  }
}
