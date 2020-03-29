import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:graphql_app/data/boleto/boleto_data.dart';
import 'package:graphql_app/model/empresa/empresa_model.dart';
import 'package:graphql_app/utils/tema.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BoletosScreen extends StatefulWidget {
  @override
  _BoletosScreenState createState() => _BoletosScreenState();
}

class _BoletosScreenState extends State<BoletosScreen> {
  GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollController = ScrollController();

  DataBoleto controller = DataBoleto();

  Widget buildListaEmpresas(List<Empresa> listaEmpresa) {
    return ListView.builder(
      itemCount: listaEmpresa.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Observer(
          builder: (_) {
            return false
                ? Container(
                    margin: EdgeInsets.all(6),
                    padding: EdgeInsets.only(
                      right: 12,
                      left: 12,
                      bottom: 6,
                      top: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Tema.corPrincipal,
                      //border: Border.all(color: tema.corPrincipal),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                      child: Text(
                        listaEmpresa[index].nome,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () async {
                      // controller.setSelecionado(index);

                      // controller.ocorrencias =
                      //     await controller.listarOcorrencias(
                      //   idCategoria:
                      //       listaOcorrencias[index].idProntuarioCategoria,
                      // );
                    },
                    child: Container(
                      margin: EdgeInsets.all(6),
                      padding: EdgeInsets.only(
                          right: 12, left: 12, bottom: 6, top: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(
                        child: Text(
                          listaEmpresa[index].nome,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Tema.corPrincipal,
        centerTitle: true,
        title: Text(
          'Boletos',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: size.height * 0.9,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: 45,
                      color: Colors.white,
                      child: Query(
                        options: controller.getBoletos(
                          idCliente: '5e775c3050723c3d47351c36',
                        ),
                        builder: (QueryResult result,
                            {VoidCallback refetch, FetchMore fetchMore}) {
                          if (result.loading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          List<Empresa> empresas = List<Empresa>();

                          empresas.add(Empresa(nome: 'Todas'));
                          result.data['getBoletos'].forEach((value) {
                            empresas.add(Empresa.fromJson(value['empresa']));
                          });
                          print(empresas.length);
                          return buildListaEmpresas(empresas);
                        },
                      )),
                  //pages(),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: size.height * 0.065),
                  //   child: listaOcorrencias(),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
