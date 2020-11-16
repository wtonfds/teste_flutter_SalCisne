class Produto {
  String nome;
  String local;
  int quantidade;

  Produto({
    this.nome,
    this.local,
    this.quantidade,
  });

  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
        nome: json["produto"]["nome"],
        local: json["filial"]["razaoSocial"],
        quantidade: json["quantidade"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "local": local,
        "quantidade": quantidade,
      };
}
