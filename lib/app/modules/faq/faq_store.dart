import 'package:mobx/mobx.dart';
import 'package:pollos_digital/loading_store.dart';

part 'faq_store.g.dart';

class FAQStore = FAQStoreBase with _$FAQStore;

abstract class FAQStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();

  @action
  Future<void> init() async {}

  @action
  void reset() {}
}
