import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novo_projeto/components/Editor.dart';
import 'package:novo_projeto/models/Viagens.dart';


const _tituloAppBar = 'ORIGEM E DESTINO';

const _rotuloOrigem  = 'Origem';
const _hintOrigem  = 'Ex.: Brasil';

const _rotuloDestino  = 'Destino';
const _hintDestino  = 'Ex.: China';

const _botao = 'Confirmar';



class FormViagem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormViagemState();
  }

}

class FormViagemState extends State<FormViagem> {
  final _controladorOrigem = TextEditingController();

  final _controladorDestino = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_tituloAppBar),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.indigo[700], Colors.purple[100]],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorOrigem,
                rotulo: _rotuloOrigem ,
                dica: _hintOrigem,
                icone: Icons.flight_takeoff),
            Editor(
                controlador: _controladorDestino,
                rotulo: _rotuloDestino,
                dica: _hintDestino,
                icone: Icons.flight_land),
            RaisedButton(
              onPressed: () {
                _CriaViagem(context);
              },
              child: Container(
                child: Text(_botao),
                height: 15.0,
              ),
              color: Colors.deepPurple[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
            ),
          ],
        ),
      ),
    );
  }
  void _CriaViagem(BuildContext context) {
    debugPrint(_controladorOrigem.text);
    debugPrint(_controladorDestino.text);

    final String origem = _controladorOrigem.text;
    final String destino = _controladorDestino.text;
    VarViagem(origem, destino);
    if (origem != null && destino != null) {
      final ViagemCriada = VarViagem(origem, destino);
      debugPrint('Viagem Criada: $ViagemCriada');
      Navigator.pop(context, ViagemCriada);
    }
  }
}