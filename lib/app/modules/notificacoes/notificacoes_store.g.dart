// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacoes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificacoesStore on NotificacoesStoreBase, Store {
  late final _$notificacoesAtom =
      Atom(name: 'NotificacoesStoreBase.notificacoes', context: context);

  @override
  ObservableList<NotificacaoModel> get notificacoes {
    _$notificacoesAtom.reportRead();
    return super.notificacoes;
  }

  @override
  set notificacoes(ObservableList<NotificacaoModel> value) {
    _$notificacoesAtom.reportWrite(value, super.notificacoes, () {
      super.notificacoes = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('NotificacoesStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getNotificacoesAsyncAction =
      AsyncAction('NotificacoesStoreBase.getNotificacoes', context: context);

  @override
  Future<void> getNotificacoes() {
    return _$getNotificacoesAsyncAction.run(() => super.getNotificacoes());
  }

  late final _$lerNotificacaoAsyncAction =
      AsyncAction('NotificacoesStoreBase.lerNotificacao', context: context);

  @override
  Future<void> lerNotificacao(NotificacaoModel notificacao) {
    return _$lerNotificacaoAsyncAction
        .run(() => super.lerNotificacao(notificacao));
  }

  late final _$NotificacoesStoreBaseActionController =
      ActionController(name: 'NotificacoesStoreBase', context: context);

  @override
  void reset() {
    final _$actionInfo = _$NotificacoesStoreBaseActionController.startAction(
        name: 'NotificacoesStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$NotificacoesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notificacoes: ${notificacoes}
    ''';
  }
}
