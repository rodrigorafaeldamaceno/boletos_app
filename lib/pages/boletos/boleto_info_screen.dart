import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_app/model/boleto/boleto_model.dart';
import 'package:graphql_app/utils/tema.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BoletoInfoScreen extends StatefulWidget {
  BoletoInfoScreen({this.boleto});

  Boleto boleto;
  String linhaDigitavelBoleto;

  @override
  _BoletoInfoScreenState createState() => _BoletoInfoScreenState();
}

class _BoletoInfoScreenState extends State<BoletoInfoScreen> {
  NumberFormat formatter = NumberFormat("###,###,###.00");
  final GlobalKey scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildBotoes() {
    // CustomProgressDialog customPr = CustomProgressDialog(context: context);

    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: FlatButton.icon(
            textColor: Colors.white,
            onPressed: () {
              Clipboard.setData(
                  ClipboardData(text: widget.linhaDigitavelBoleto));
              // CustomSnackbar.mostrarSucesso(
              //     "Código copiado com sucesso", scaffoldKey, context);
            },
            icon: Icon(
              Icons.content_copy,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            label: Text("COPIAR CÓDIGO"),
            color: Colors.blue,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: FlatButton.icon(
            onPressed: () async {
              // customPr.pr.style(message: 'Baixando boleto...');
              // await customPr.pr.show();
              // await widget.controller.downloadBoletoDio(
              //     idBoleto: widget.boleto.idBoleto,
              //     idTransacao: widget.boleto.idTransacao);
              // await customPr.pr.dismiss();
            },
            textColor: Colors.white,
            icon: Icon(
              MdiIcons.download,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            label: Text("BAIXAR BOLETO"),
            color: Colors.red,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: FlatButton.icon(
            onPressed: () async {
              // customPr.pr.style(message: 'Enviando boleto...');
              // await customPr.pr.show();
              // String msg = await widget.controller.enviarBoletoEmail(
              //   idBoleto: widget.boleto.idBoleto,
              // );
              // await customPr.pr.dismiss();
              // if (msg == 'ERRO') {
              //   CustomSnackbar.mostrarErro(
              //       'Erro ao enviar boleto por email', scaffoldKey, context);
              // } else {
              //   CustomSnackbar.mostrarSucesso(
              //     msg,
              //     scaffoldKey,
              //     context,
              //   );
              // }
            },
            textColor: Colors.white,
            icon: Icon(
              Icons.email,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            label: Text("ENVIAR POR EMAIL"),
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool boletoDisponivel = widget.boleto.status != 'PAGO';

    String valorFormatado = widget.boleto.valor != 0.0
        ? formatter.format(widget.boleto.valor)
        : '0,00';
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Tema.corPrincipal,
        title: Text(
          "Boleto",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Tema.corPrincipal,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                "Vencimento: ${widget.boleto.dataVencimento}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                "R\$ $valorFormatado",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 30),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    "*O seu pagamento será confirmado em até 3 dias úteis.",
                    style: TextStyle(fontSize: 15, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 30),
              if (boletoDisponivel)
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      "Utilize o número do código de barras abaixo para realizar o pagamento:",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (boletoDisponivel)
                    Flexible(
                      child: Text(
                        widget.boleto.codigo,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
              if (boletoDisponivel) _buildBotoes()
            ],
          ),
        ),
      ),
    );
  }
}
