import 'package:flutter/foundation.dart';

class BoletoQueryMutation {
  String getBoletos(String idCliente, String idEmpresa) {
    String queryEmpresa = "";
    if (idEmpresa != null) queryEmpresa = 'empresa:"$idEmpresa"';

    return '''
      query getBoletos{
        getBoletos(cliente:"$idCliente" $queryEmpresa){
          id
          valor
          status
          codigo
          dataVencimento
          mesReferencia
          empresa{
            id
            nome
            email
            telefone
            cnpj
          }
          cliente{
            id
            nome
            email
          }
        }
      }
    ''';
  }

  String getBoleto() {
    return '''
     
    ''';
  }
}
