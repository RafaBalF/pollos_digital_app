import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/home/home_page.dart';
import 'package:pollos_digital/app/modules/home/home_store.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
      transition: defaultTransitonType,
    );
  }
}
