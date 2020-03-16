import 'package:flutter/material.dart';

import 'package:novo_projeto/screen/Lista.dart';

void main() =>
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.indigo[300],
          accentColor: Colors.deepPurpleAccent[800],
        ),
        home: Scaffold(
            body: /* Configuracoes() */ Viagens(),
        ),
      ),
    );


