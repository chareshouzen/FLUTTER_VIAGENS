import 'package:flutter/material.dart';
import 'package:novo_projeto/components/Editor.dart';
import 'package:novo_projeto/models/Viagens.dart';

const _tituloAppBar = 'EDITAR ORIGEM E DESTINO';

const _rotuloOrigem = 'Origem';

const _rotuloDestino = 'Destino';

const _botao = 'Confirmar';
VarViagem _viagem;

class FormEditViagem extends StatefulWidget {
  FormEditViagem(VarViagem viagem) {
    _viagem = viagem;
  }

  @override
  _FormEditViagemState createState() => _FormEditViagemState();
}

class _FormEditViagemState extends State<FormEditViagem> {
  final _controladorOrigem = TextEditingController();

  final _controladorDestino = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("IMAGENS/back.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(_tituloAppBar),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.greenAccent[100], Colors.pink[100]],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                  controlador: _controladorOrigem,
                  rotulo: _rotuloOrigem,
                  dica: 'Atual: ${_viagem.origem}',
                  icone: Icons.flight_takeoff),
              Editor(
                  controlador: _controladorDestino,
                  rotulo: _rotuloDestino,
                  dica: 'Atual: ${_viagem.destino}',
                  icone: Icons.flight_land),
              RaisedButton(
                onPressed: () {
                  _EditarViagem();
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
      ),
    );
  }

  void _EditarViagem() {
    //FUNÇAO CRIAR VIAGEM
    debugPrint(_controladorOrigem.text);
    debugPrint(_controladorDestino.text);

    final String origem = _controladorOrigem.text;
    final String destino = _controladorDestino.text;
    if (origem != null && destino != null) {
      setState(() {
        _viagem.origem = origem;
        _viagem.destino = destino;
      });
      debugPrint('Viagem Atualizada: $_viagem');
      Navigator.pop(context, _viagem); //FECHA FORMULARIO
    }
  }
}
