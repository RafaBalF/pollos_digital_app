import 'package:mobx/mobx.dart';

part 'loading_store.g.dart';

class LoadingStore = LoadingStoreBase with _$LoadingStore;

abstract class LoadingStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void show() {
    isLoading = true;
  }

  @action
  void hide() {
    isLoading = false;
  }
}
