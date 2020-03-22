import 'package:flutter/material.dart';
import 'package:graphql_app/utils/tema.dart';

Widget cardTituloHome(BuildContext context, {String texto}) {

  return Container(
    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          color: Tema.corPrincipal,
          width: 6,
          height: 34,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          texto,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        )
      ],
    ),
  );
}
