import 'package:mobx/mobx.dart';

part 'curriculo_store.g.dart';

class CurriculoStore = CurriculoStoreBase with _$CurriculoStore;

abstract class CurriculoStoreBase with Store {
  @action
  Future<void> init() async {}
}
