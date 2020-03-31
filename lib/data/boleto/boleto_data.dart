import 'package:flutter/widgets.dart';
import 'package:graphql_app/data/boleto/boleto_query_mutation.dart';
import 'package:graphql_app/data/cliente/cliente_query_mutation.dart';
import 'package:graphql_app/utils/graphql_configuration/graphql_configuration.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:mobx/mobx.dart';
part 'boleto_data.g.dart';

class DataBoleto = _DataBoletoBase with _$DataBoleto;

abstract class _DataBoletoBase with Store {
  @observable
  int empresaSelecionada = 0;

  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  @observable
  String idEmpresa;

  BoletoQueryMutation querys = BoletoQueryMutation();

  @action
  setSmpresaSelecionada(int index) {
    empresaSelecionada = index;
  }

  @action
  setIdEmpresa(String id){
    idEmpresa = id;
  }

  BaseOptions getBoletos(
      {@required String idCliente,
      String idEmpresa,
      bool distinctEmpresa: false}) {
    return QueryOptions(
      documentNode: gql(
        querys.getBoletos(
          idCliente: idCliente,
          idEmpresa: idEmpresa,
          distinctEmpresa: distinctEmpresa,
        ),
      ),
      pollInterval: 10,
    );
  }
}
