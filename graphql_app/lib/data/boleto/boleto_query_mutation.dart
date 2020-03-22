import 'package:flutter/foundation.dart';

class BoletoQueryMutation {
  String getBoletos(String idCliente, String idEmpresa) {
    return '''
      query getBoletos{
        getBoletos(cliente:"$idCliente", empresa:"$idEmpresa"){
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
