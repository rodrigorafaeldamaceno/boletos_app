import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:graphql_app/data/boleto/boleto_data.dart';
import 'package:graphql_app/model/boleto/boleto_model.dart';
import 'package:graphql_app/model/empresa/empresa_model.dart';
import 'package:graphql_app/pages/boletos/card_boleto.dart';
import 'package:graphql_app/utils/tema.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BoletosScreen extends StatefulWidget {
  @override
  _BoletosScreenState createState() => _BoletosScreenState();
}

class _BoletosScreenState extends State<BoletosScreen> {
  DataBoleto controller = DataBoleto();

  GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Widget buildListaEmpresas(List<Empresa> listaEmpresa) {
    return ListView.builder(
      itemCount: listaEmpresa.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Observer(
          builder: (_) {
            return controller.empresaSelecionada == index
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
                      controller.setSmpresaSelecionada(index);
                      controller.setIdEmpresa(listaEmpresa[index].id);

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

  buildListaBoletos({bool todosBoletos: true}) {
    return Query(
      options: controller.getBoletos(
        idCliente: "5e775c3050723c3d47351c36",
        idEmpresa: controller.idEmpresa,
      ),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Boleto> boletos = List<Boleto>();
        List<Boleto> boletosAbertos = List<Boleto>();

        result.data['getBoletos'].forEach((value) {
          boletos.add(Boleto.fromJson(value));
          if (value['status'] == "ABERTO")
            boletosAbertos.add(Boleto.fromJson(value));
        });

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: todosBoletos ? boletos.length : boletosAbertos.length,
          itemBuilder: (BuildContext context, int index) {
            return CardBoleto(
              boleto: todosBoletos ? boletos[index] : boletosAbertos[index],
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
      // key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Tema.corPrincipal,
        centerTitle: true,
        title: Text(
          'Boletos',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 45,
              color: Colors.white,
              child: Query(
                options: controller.getBoletos(
                    idCliente: '5e775c3050723c3d47351c36',
                    distinctEmpresa: true),
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
                  return buildListaEmpresas(empresas);
                },
              ),
            ),
            Container(
              height: size.height * 0.7,
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: new Size(double.infinity, size.height * 0.1),
                    child: Container(
                      child: TabBar(
                        unselectedLabelColor: Colors.black54,
                        labelPadding: EdgeInsets.symmetric(vertical: 8),
                        labelColor: Tema.corPrincipal,
                        indicatorColor: Tema.corPrincipal,
                        labelStyle: TextStyle(fontWeight: FontWeight.w700),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                        indicatorWeight: 3.0,
                        tabs: [
                          Tab(text: "Em aberto"),
                          Tab(text: "Todos"),
                        ],
                      ),
                    ),
                  ),
                  body: Container(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Observer(
                            builder: (_) {
                              return buildListaBoletos(todosBoletos: false);
                            },
                          ),
                        ),
                        SingleChildScrollView(
                          child: Observer(
                            builder: (_) {
                              return buildListaBoletos();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
