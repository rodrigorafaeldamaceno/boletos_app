import 'package:flutter/material.dart';
import 'package:graphql_app/data/boleto/boleto_data.dart';
import 'package:graphql_app/model/boleto/boleto_model.dart';
import 'package:graphql_app/pages/boletos/card_boleto.dart';
import 'package:graphql_app/utils/tema.dart';
import 'package:graphql_app/widgets/card_titulo_home.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CardBoletosHome extends StatelessWidget {
  DataBoleto controller = DataBoleto();
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: EdgeInsets.only(left: 0, right: 10),
      child: ExpansionTile(
        title: cardTituloHome(
          context,
          texto: 'Boletos recentes',
        ),
        initiallyExpanded: true,
        children: <Widget>[
          Query(
            options: controller.getBoletos("5e775c3050723c3d47351c36"),
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {

              List<Boleto> boletos = [];
              result.data['getBoletos'].forEach((value) {
                boletos.add(Boleto.fromJson(value));
              });

              print("Boletos: ${boletos.length}");
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: boletos.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardBoleto(
                    boleto: boletos[index],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

Widget semBoletos({String texto, IconData icone}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Flexible(
          child: Text(
            texto,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(width: 6),
        Icon(
          icone,
          color: Colors.grey,
          size: 32,
        )
      ],
    ),
  );
}
