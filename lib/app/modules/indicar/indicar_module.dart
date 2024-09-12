import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/indicar/indicar_page.dart';
import 'package:pollos_digital/app/modules/indicar/indicar_store.dart';

class IndicarModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(IndicarStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const IndicarPage(),
      transition: defaultTransitonType,
    );
  }
}
