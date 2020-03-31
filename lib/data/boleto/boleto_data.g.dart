// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boleto_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataBoleto on _DataBoletoBase, Store {
  final _$empresaSelecionadaAtom =
      Atom(name: '_DataBoletoBase.empresaSelecionada');

  @override
  int get empresaSelecionada {
    _$empresaSelecionadaAtom.context
        .enforceReadPolicy(_$empresaSelecionadaAtom);
    _$empresaSelecionadaAtom.reportObserved();
    return super.empresaSelecionada;
  }

  @override
  set empresaSelecionada(int value) {
    _$empresaSelecionadaAtom.context.conditionallyRunInAction(() {
      super.empresaSelecionada = value;
      _$empresaSelecionadaAtom.reportChanged();
    }, _$empresaSelecionadaAtom, name: '${_$empresaSelecionadaAtom.name}_set');
  }

  final _$idEmpresaAtom = Atom(name: '_DataBoletoBase.idEmpresa');

  @override
  String get idEmpresa {
    _$idEmpresaAtom.context.enforceReadPolicy(_$idEmpresaAtom);
    _$idEmpresaAtom.reportObserved();
    return super.idEmpresa;
  }

  @override
  set idEmpresa(String value) {
    _$idEmpresaAtom.context.conditionallyRunInAction(() {
      super.idEmpresa = value;
      _$idEmpresaAtom.reportChanged();
    }, _$idEmpresaAtom, name: '${_$idEmpresaAtom.name}_set');
  }

  final _$_DataBoletoBaseActionController =
      ActionController(name: '_DataBoletoBase');

  @override
  dynamic setSmpresaSelecionada(int index) {
    final _$actionInfo = _$_DataBoletoBaseActionController.startAction();
    try {
      return super.setSmpresaSelecionada(index);
    } finally {
      _$_DataBoletoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIdEmpresa(String id) {
    final _$actionInfo = _$_DataBoletoBaseActionController.startAction();
    try {
      return super.setIdEmpresa(id);
    } finally {
      _$_DataBoletoBaseActionController.endAction(_$actionInfo);
    }
  }
}
