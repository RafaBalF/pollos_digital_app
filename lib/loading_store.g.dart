// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoadingStore on LoadingStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'LoadingStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$LoadingStoreBaseActionController =
      ActionController(name: 'LoadingStoreBase', context: context);

  @override
  void show() {
    final _$actionInfo = _$LoadingStoreBaseActionController.startAction(
        name: 'LoadingStoreBase.show');
    try {
      return super.show();
    } finally {
      _$LoadingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hide() {
    final _$actionInfo = _$LoadingStoreBaseActionController.startAction(
        name: 'LoadingStoreBase.hide');
    try {
      return super.hide();
    } finally {
      _$LoadingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
