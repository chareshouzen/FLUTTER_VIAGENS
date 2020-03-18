import 'package:flutter/material.dart';

import 'package:novo_projeto/screen/Lista.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.indigo[300],
          accentColor: Colors.deepPurpleAccent[800],
            fontFamily: "Raleway",
        ),
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("IMAGENS/back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: /* Configuracoes() */ Viagens(),
          ),
        ),
      ),
    );
