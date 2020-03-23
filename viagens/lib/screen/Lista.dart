import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:novo_projeto/models/Viagens.dart';
import 'package:novo_projeto/models/caixas_dialogos.dart';
import 'package:novo_projeto/screen/config.dart';
import 'Formulario.dart';

class Viagens extends StatefulWidget {
  final List<VarViagem> _viagens = List();

  @override
  State<StatefulWidget> createState() {
    return ViagensState();
  }
}

class ViagensState extends State<Viagens> {
  var _opcoes = [
    "Configurações",
    "Sair",
  ];

  choiceAction(String choice) {
    switch (choice) {
      case "Configurações":
        print("Item escolhido: $choice");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Configuracoes();
            },
          ),
        );
        break;
      case "Sair":
        print("Item escolhido: $choice");
        AlertaSair(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return _opcoes.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
        centerTitle: true,
        title: Text(
          'V I A G E N S',
          style: TextStyle(
            fontFamily: "Raleway",
            fontSize: 26.0,
            color: Colors.white,
          ),
        ),
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
      body: ListView.builder(
        itemCount: widget._viagens.length,
        itemBuilder: (context, indice) {
          final Viagem = widget._viagens[indice];
          return Dismissible(
            movementDuration: const Duration(milliseconds: 1000),
            key: UniqueKey(),
            // ignore: missing_return
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                final bool resposta = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text("Deletar este item?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              "Cancelar",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text(
                              "Deletar",
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              setState(() {
                                widget._viagens.removeAt(indice);
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
                return resposta;
              } else {
                final bool resp = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text("Editar este item?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              "Cancelar",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text(
                              "Editar",
                              style: TextStyle(color: Colors.blue),
                            ),
                            onPressed: () {
                              /* setState(() {

                              }); */
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Viagens();
                                  },
                                ),
                              );

                              //TODO ABRIR PAGINA EDITAR
                            },
                          ),
                        ],
                      );
                    });
                return resp;
              }
            },
            /* direction: DismissDirection.startToEnd, */
            /*onDismissed: (DismissDirection direction) {
                widget._viagens.removeAt(indice); //DELETA PRA SMP
                DeleteItem(context); //CHAMA A CAIXA DE DIALOGO
              }, */
            child: ItemViagem(Viagem),
            background: slideRightBackground(),
            secondaryBackground: slideLeftBackground(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.airplanemode_active,
        ),
        backgroundColor: Colors.indigo[100],
        onPressed: () {
          final Future<VarViagem> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormViagem();
              },
            ),
          );
          var vazio;
          vazio = "";
          future.then(
            (ViagemRecebida) async {
              debugPrint('$ViagemRecebida');
              debugPrint('CHEGOU');
              if (ViagemRecebida != null) {
                widget._viagens.add(ViagemRecebida);
              }
            },
          );
        },
      ),
    );
  }
}

// CLASSE ITENS VIAGEM
class ItemViagem extends StatelessWidget {
  final VarViagem _viagem;

  ItemViagem(this._viagem);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: ListTile(
        title: Text(
          _viagem.origem.toString(),
        ),
        subtitle: Text(
          _viagem.destino.toString(),
        ),
        leading: Icon(Icons.flight), //EDITAR
        onLongPress: () {
          return Edit(context);
        },
        /*   trailing: IconButton(
             icon: Icon(Icons.delete),
              onPressed: () {
                DeleteItem(context);
              },
              iconSize: 24.00,
            ), */
      ),
    );
  }
}

//BOTAO COM IMAGEM TESTE
/*
class BOTAO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        print('APERTOU O ICONE');
      },
      child: Image.asset('IMAGENS/icone.png',
          height: 50.0,
          width: 55.00,
          alignment: Alignment.center,
          fit: BoxFit.cover),
    );
  }
} */

Widget slideLeftBackground() {
  return Container(
    color: Colors.red[200],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        Container(
          child: Text(
            'DELETE',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

Widget slideRightBackground() {
  return Container(
    color: Colors.blueAccent[100],
    alignment: Alignment(-0.9, 0),
    child: Row(
      children: <Widget>[
        Container(
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
        Container(
          child: Text(
            'EDIT',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
