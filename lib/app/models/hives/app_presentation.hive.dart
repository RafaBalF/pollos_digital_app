import 'package:hive/hive.dart';

class AppPresentationHive {
  Future<bool> boxExists() async {
    return await Hive.boxExists('app_presentation');
  }

  //guests
  Future<void> setHasSeenAppPresentationBefore(bool b) async {
    return await Hive.box('app_presentation')
        .put('hasSeenAppPresentationBefore', b);
  }

  bool hasSeenAppPresentationBefore() {
    return Hive.box('app_presentation')
        .containsKey('hasSeenAppPresentationBefore');
  }

  Future<void> deleteHasSeenAppPresentationBefore() {
    return Hive.box('app_presentation').delete('hasSeenAppPresentationBefore');
  }
}
