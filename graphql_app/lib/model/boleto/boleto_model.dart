import 'package:graphql_app/model/cliente/cliente_model.dart';
import 'package:graphql_app/model/empresa/empresa_model.dart';

class Boleto {
  String id;
  double valor;
  String status;
  String codigo;
  String dataValidade;
  Empresa empresa;
  Cliente cliente;

  Boleto(
      {this.id,
      this.valor,
      this.status,
      this.codigo,
      this.dataValidade,
      this.empresa,
      this.cliente});

  Boleto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    valor = json['valor'];
    status = json['status'];
    codigo = json['codigo'];
    dataValidade = json['dataValidade'];
    empresa =
        json['empresa'] != null ? new Empresa.fromJson(json['empresa']) : null;
    cliente =
        json['cliente'] != null ? new Cliente.fromJson(json['cliente']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['valor'] = this.valor;
    data['status'] = this.status;
    data['codigo'] = this.codigo;
    data['dataValidade'] = this.dataValidade;
    if (this.empresa != null) {
      data['empresa'] = this.empresa.toJson();
    }
    if (this.cliente != null) {
      data['cliente'] = this.cliente.toJson();
    }
    return data;
  }
}
