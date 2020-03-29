class Empresa {
  String id;
  String nome;
  String email;
  String telefone;
  String cnpj;

  Empresa({this.id, this.nome, this.email, this.telefone, this.cnpj});

  Empresa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    telefone = json['telefone'];
    cnpj = json['cnpj'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    data['cnpj'] = this.cnpj;
    return data;
  }
}
