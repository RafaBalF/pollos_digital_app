import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/launch/launch_page.dart';
import 'package:pollos_digital/app/modules/launch/launch_store.dart';
import 'package:pollos_digital/app/modules/launch/version_update_page.dart';

class LaunchModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(LaunchStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const LaunchPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/version-update',
      child: (context) => const VersionUpdatePage(),
      transition: defaultTransitonType,
    );
  }
}
