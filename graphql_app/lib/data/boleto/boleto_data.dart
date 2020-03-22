import 'package:graphql_app/data/boleto/boleto_query_mutation.dart';
import 'package:graphql_app/data/cliente/cliente_query_mutation.dart';
import 'package:graphql_app/utils/graphql_configuration/graphql_configuration.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DataBoleto {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  BoletoQueryMutation querys = BoletoQueryMutation();

  BaseOptions getBoletos(String idCliente, {String idEmpresa}) {
    return QueryOptions(
      documentNode: gql(
        querys.getBoletos(idCliente, idEmpresa),
      ),
      pollInterval: 10,
    );
  }
}
