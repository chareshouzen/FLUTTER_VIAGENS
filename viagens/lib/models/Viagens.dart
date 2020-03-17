class VarViagem {  //VARIAVEIS VIAGEM
   dynamic origem;
  final String destino;

  VarViagem(this.origem, this.destino);

  @override
  String toString() {
    return '$origem ->'
        ' $destino.';
  }
}