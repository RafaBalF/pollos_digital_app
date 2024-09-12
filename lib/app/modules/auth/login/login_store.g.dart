// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$authModelAtom =
      Atom(name: 'LoginStoreBase.authModel', context: context);

  @override
  AuthModel? get authModel {
    _$authModelAtom.reportRead();
    return super.authModel;
  }

  @override
  set authModel(AuthModel? value) {
    _$authModelAtom.reportWrite(value, super.authModel, () {
      super.authModel = value;
    });
  }

  late final _$cpfAtom = Atom(name: 'LoginStoreBase.cpf', context: context);

  @override
  String? get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String? value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$senhaAtom = Atom(name: 'LoginStoreBase.senha', context: context);

  @override
  String? get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String? value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$logoutAsyncAction =
      AsyncAction('LoginStoreBase.logout', context: context);

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$getAuthModelAsyncAction =
      AsyncAction('LoginStoreBase.getAuthModel', context: context);

  @override
  Future<void> getAuthModel() {
    return _$getAuthModelAsyncAction.run(() => super.getAuthModel());
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginStoreBase.login', context: context);

  @override
  Future<BaseModel<AuthModel>> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase', context: context);

  @override
  void setAuthModel(AuthModel model) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setAuthModel');
    try {
      return super.setAuthModel(model);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String? value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String? value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authModel: ${authModel},
cpf: ${cpf},
senha: ${senha}
    ''';
  }
}
