// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indicar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IndicarStore on IndicarStoreBase, Store {
  late final _$indicadosAtom =
      Atom(name: 'IndicarStoreBase.indicados', context: context);

  @override
  ObservableList<IndicadoModel> get indicados {
    _$indicadosAtom.reportRead();
    return super.indicados;
  }

  @override
  set indicados(ObservableList<IndicadoModel> value) {
    _$indicadosAtom.reportWrite(value, super.indicados, () {
      super.indicados = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('IndicarStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$indicarAsyncAction =
      AsyncAction('IndicarStoreBase.indicar', context: context);

  @override
  Future<BaseModel<EmptyResponseModel>> indicar(
      String nomeIndicou, String telefoneIndicado) {
    return _$indicarAsyncAction
        .run(() => super.indicar(nomeIndicou, telefoneIndicado));
  }

  late final _$IndicarStoreBaseActionController =
      ActionController(name: 'IndicarStoreBase', context: context);

  @override
  void reset() {
    final _$actionInfo = _$IndicarStoreBaseActionController.startAction(
        name: 'IndicarStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$IndicarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indicados: ${indicados}
    ''';
  }
}
