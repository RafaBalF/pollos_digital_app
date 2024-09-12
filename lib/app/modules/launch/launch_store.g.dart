// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LaunchStore on LaunchStoreBase, Store {
  late final _$usingAppForFirstTimeAtom =
      Atom(name: 'LaunchStoreBase.usingAppForFirstTime', context: context);

  @override
  bool get usingAppForFirstTime {
    _$usingAppForFirstTimeAtom.reportRead();
    return super.usingAppForFirstTime;
  }

  @override
  set usingAppForFirstTime(bool value) {
    _$usingAppForFirstTimeAtom.reportWrite(value, super.usingAppForFirstTime,
        () {
      super.usingAppForFirstTime = value;
    });
  }

  late final _$presentationIndexAtom =
      Atom(name: 'LaunchStoreBase.presentationIndex', context: context);

  @override
  int get presentationIndex {
    _$presentationIndexAtom.reportRead();
    return super.presentationIndex;
  }

  @override
  set presentationIndex(int value) {
    _$presentationIndexAtom.reportWrite(value, super.presentationIndex, () {
      super.presentationIndex = value;
    });
  }

  late final _$checkForUpdatesAtom =
      Atom(name: 'LaunchStoreBase.checkForUpdates', context: context);

  @override
  bool get checkForUpdates {
    _$checkForUpdatesAtom.reportRead();
    return super.checkForUpdates;
  }

  @override
  set checkForUpdates(bool value) {
    _$checkForUpdatesAtom.reportWrite(value, super.checkForUpdates, () {
      super.checkForUpdates = value;
    });
  }

  late final _$packageInfoAtom =
      Atom(name: 'LaunchStoreBase.packageInfo', context: context);

  @override
  PackageInfo get packageInfo {
    _$packageInfoAtom.reportRead();
    return super.packageInfo;
  }

  @override
  set packageInfo(PackageInfo value) {
    _$packageInfoAtom.reportWrite(value, super.packageInfo, () {
      super.packageInfo = value;
    });
  }

  late final _$shouldUpdateAtom =
      Atom(name: 'LaunchStoreBase.shouldUpdate', context: context);

  @override
  bool get shouldUpdate {
    _$shouldUpdateAtom.reportRead();
    return super.shouldUpdate;
  }

  @override
  set shouldUpdate(bool value) {
    _$shouldUpdateAtom.reportWrite(value, super.shouldUpdate, () {
      super.shouldUpdate = value;
    });
  }

  late final _$versionAtom =
      Atom(name: 'LaunchStoreBase.version', context: context);

  @override
  String get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  late final _$obligatoryAtom =
      Atom(name: 'LaunchStoreBase.obligatory', context: context);

  @override
  bool get obligatory {
    _$obligatoryAtom.reportRead();
    return super.obligatory;
  }

  @override
  set obligatory(bool value) {
    _$obligatoryAtom.reportWrite(value, super.obligatory, () {
      super.obligatory = value;
    });
  }

  late final _$getAppVersionAsyncAction =
      AsyncAction('LaunchStoreBase.getAppVersion', context: context);

  @override
  Future<void> getAppVersion() {
    return _$getAppVersionAsyncAction.run(() => super.getAppVersion());
  }

  late final _$checkShowPresentationAsyncAction =
      AsyncAction('LaunchStoreBase.checkShowPresentation', context: context);

  @override
  Future<void> checkShowPresentation() {
    return _$checkShowPresentationAsyncAction
        .run(() => super.checkShowPresentation());
  }

  late final _$setHasSeenAppPresentationBeforeAsyncAction = AsyncAction(
      'LaunchStoreBase.setHasSeenAppPresentationBefore',
      context: context);

  @override
  Future<void> setHasSeenAppPresentationBefore() {
    return _$setHasSeenAppPresentationBeforeAsyncAction
        .run(() => super.setHasSeenAppPresentationBefore());
  }

  late final _$LaunchStoreBaseActionController =
      ActionController(name: 'LaunchStoreBase', context: context);

  @override
  void ignoreUpdates() {
    final _$actionInfo = _$LaunchStoreBaseActionController.startAction(
        name: 'LaunchStoreBase.ignoreUpdates');
    try {
      return super.ignoreUpdates();
    } finally {
      _$LaunchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementPresentationIndex({int index = 1}) {
    final _$actionInfo = _$LaunchStoreBaseActionController.startAction(
        name: 'LaunchStoreBase.incrementPresentationIndex');
    try {
      return super.incrementPresentationIndex(index: index);
    } finally {
      _$LaunchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usingAppForFirstTime: ${usingAppForFirstTime},
presentationIndex: ${presentationIndex},
checkForUpdates: ${checkForUpdates},
packageInfo: ${packageInfo},
shouldUpdate: ${shouldUpdate},
version: ${version},
obligatory: ${obligatory}
    ''';
  }
}
