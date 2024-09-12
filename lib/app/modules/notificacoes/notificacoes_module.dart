import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/notificacoes/notificacoes_page.dart';
import 'package:pollos_digital/app/modules/notificacoes/notificacoes_store.dart';

class NotificacoesModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(NotificacoesStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const NotificacoesPage(),
      transition: defaultTransitonType,
    );
  }
}
