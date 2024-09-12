// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on RegisterStoreBase, Store {
  Computed<bool>? _$validCodeComputed;

  @override
  bool get validCode =>
      (_$validCodeComputed ??= Computed<bool>(() => super.validCode,
              name: 'RegisterStoreBase.validCode'))
          .value;

  late final _$authModelAtom =
      Atom(name: 'RegisterStoreBase.authModel', context: context);

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

  late final _$cpfAtom = Atom(name: 'RegisterStoreBase.cpf', context: context);

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

  late final _$passwordAtom =
      Atom(name: 'RegisterStoreBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: 'RegisterStoreBase.confirmPassword', context: context);

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$codeAtom =
      Atom(name: 'RegisterStoreBase.code', context: context);

  @override
  String? get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String? value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$counterAtom =
      Atom(name: 'RegisterStoreBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$logoutAsyncAction =
      AsyncAction('RegisterStoreBase.logout', context: context);

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$getAuthModelAsyncAction =
      AsyncAction('RegisterStoreBase.getAuthModel', context: context);

  @override
  Future<void> getAuthModel() {
    return _$getAuthModelAsyncAction.run(() => super.getAuthModel());
  }

  late final _$registerAsyncAction =
      AsyncAction('RegisterStoreBase.register', context: context);

  @override
  Future<BaseModel<AuthModel>> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$resendSMSAsyncAction =
      AsyncAction('RegisterStoreBase.resendSMS', context: context);

  @override
  Future<BaseModel<StringResponseModel>> resendSMS() {
    return _$resendSMSAsyncAction.run(() => super.resendSMS());
  }

  late final _$validateCodeAsyncAction =
      AsyncAction('RegisterStoreBase.validateCode', context: context);

  @override
  Future<BaseModel<AuthModel>> validateCode() {
    return _$validateCodeAsyncAction.run(() => super.validateCode());
  }

  late final _$RegisterStoreBaseActionController =
      ActionController(name: 'RegisterStoreBase', context: context);

  @override
  void setAuthModel(AuthModel model) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setAuthModel');
    try {
      return super.setAuthModel(model);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String? value) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String? value) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String? value) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String? value) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCounter(int value) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setCounter');
    try {
      return super.setCounter(value);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authModel: ${authModel},
cpf: ${cpf},
password: ${password},
confirmPassword: ${confirmPassword},
code: ${code},
counter: ${counter},
validCode: ${validCode}
    ''';
  }
}
