// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on ProfileStoreBase, Store {
  late final _$dadosPessoaisModelAtom =
      Atom(name: 'ProfileStoreBase.dadosPessoaisModel', context: context);

  @override
  DadosPessoaisModel? get dadosPessoaisModel {
    _$dadosPessoaisModelAtom.reportRead();
    return super.dadosPessoaisModel;
  }

  @override
  set dadosPessoaisModel(DadosPessoaisModel? value) {
    _$dadosPessoaisModelAtom.reportWrite(value, super.dadosPessoaisModel, () {
      super.dadosPessoaisModel = value;
    });
  }

  late final _$politicaDePrivacidadeAtom =
      Atom(name: 'ProfileStoreBase.politicaDePrivacidade', context: context);

  @override
  String get politicaDePrivacidade {
    _$politicaDePrivacidadeAtom.reportRead();
    return super.politicaDePrivacidade;
  }

  @override
  set politicaDePrivacidade(String value) {
    _$politicaDePrivacidadeAtom.reportWrite(value, super.politicaDePrivacidade,
        () {
      super.politicaDePrivacidade = value;
    });
  }

  late final _$senhaAtualAtom =
      Atom(name: 'ProfileStoreBase.senhaAtual', context: context);

  @override
  String? get senhaAtual {
    _$senhaAtualAtom.reportRead();
    return super.senhaAtual;
  }

  @override
  set senhaAtual(String? value) {
    _$senhaAtualAtom.reportWrite(value, super.senhaAtual, () {
      super.senhaAtual = value;
    });
  }

  late final _$contratosAtom =
      Atom(name: 'ProfileStoreBase.contratos', context: context);

  @override
  ObservableList<ContratoModel> get contratos {
    _$contratosAtom.reportRead();
    return super.contratos;
  }

  @override
  set contratos(ObservableList<ContratoModel> value) {
    _$contratosAtom.reportWrite(value, super.contratos, () {
      super.contratos = value;
    });
  }

  late final _$initProfileAsyncAction =
      AsyncAction('ProfileStoreBase.initProfile', context: context);

  @override
  Future<void> initProfile() {
    return _$initProfileAsyncAction.run(() => super.initProfile());
  }

  late final _$initDadosPessoaisAsyncAction =
      AsyncAction('ProfileStoreBase.initDadosPessoais', context: context);

  @override
  Future<void> initDadosPessoais() {
    return _$initDadosPessoaisAsyncAction.run(() => super.initDadosPessoais());
  }

  late final _$initConfiguracoesAsyncAction =
      AsyncAction('ProfileStoreBase.initConfiguracoes', context: context);

  @override
  Future<void> initConfiguracoes() {
    return _$initConfiguracoesAsyncAction.run(() => super.initConfiguracoes());
  }

  late final _$logoutAsyncAction =
      AsyncAction('ProfileStoreBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$deleteAccountAsyncAction =
      AsyncAction('ProfileStoreBase.deleteAccount', context: context);

  @override
  Future<BaseModel<EmptyResponseModel>> deleteAccount() {
    return _$deleteAccountAsyncAction.run(() => super.deleteAccount());
  }

  late final _$initPoliticasDePrivacidadeAsyncAction = AsyncAction(
      'ProfileStoreBase.initPoliticasDePrivacidade',
      context: context);

  @override
  Future<void> initPoliticasDePrivacidade() {
    return _$initPoliticasDePrivacidadeAsyncAction
        .run(() => super.initPoliticasDePrivacidade());
  }

  late final _$initRedefinirSenhaAsyncAction =
      AsyncAction('ProfileStoreBase.initRedefinirSenha', context: context);

  @override
  Future<void> initRedefinirSenha() {
    return _$initRedefinirSenhaAsyncAction
        .run(() => super.initRedefinirSenha());
  }

  late final _$redefinirSenhaAsyncAction =
      AsyncAction('ProfileStoreBase.redefinirSenha', context: context);

  @override
  Future<BaseModel<EmptyResponseModel>> redefinirSenha(
      String senhaAtual, String senhaNova) {
    return _$redefinirSenhaAsyncAction
        .run(() => super.redefinirSenha(senhaAtual, senhaNova));
  }

  late final _$initContratosAsyncAction =
      AsyncAction('ProfileStoreBase.initContratos', context: context);

  @override
  Future<void> initContratos() {
    return _$initContratosAsyncAction.run(() => super.initContratos());
  }

  late final _$ProfileStoreBaseActionController =
      ActionController(name: 'ProfileStoreBase', context: context);

  @override
  void resetProfile() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.resetProfile');
    try {
      return super.resetProfile();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDadosPessoais() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.resetDadosPessoais');
    try {
      return super.resetDadosPessoais();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetConfiguracoes() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.resetConfiguracoes');
    try {
      return super.resetConfiguracoes();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPoliticasDePrivacidade() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.resetPoliticasDePrivacidade');
    try {
      return super.resetPoliticasDePrivacidade();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenhaAtual(String s) {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.setSenhaAtual');
    try {
      return super.setSenhaAtual(s);
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetRedefinirSenha() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.resetRedefinirSenha');
    try {
      return super.resetRedefinirSenha();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetContratos() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.resetContratos');
    try {
      return super.resetContratos();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dadosPessoaisModel: ${dadosPessoaisModel},
politicaDePrivacidade: ${politicaDePrivacidade},
senhaAtual: ${senhaAtual},
contratos: ${contratos}
    ''';
  }
}
