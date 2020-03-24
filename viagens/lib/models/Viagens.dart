class VarViagem {  //VARIAVEIS VIAGEM
   dynamic origem;
  dynamic destino;

  VarViagem(this.origem, this.destino);

  @override
  String toString() {
    return '$origem ->'
        ' $destino.';
  }
}