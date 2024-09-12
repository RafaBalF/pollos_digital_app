import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/sessao/agendamento/agendamento_page.dart';
import 'package:pollos_digital/app/modules/sessao/avaliar/avaliar_page.dart';
import 'package:pollos_digital/app/modules/sessao/check_in/check_in_page.dart';
import 'package:pollos_digital/app/modules/sessao/historico/historico_page.dart';
import 'package:pollos_digital/app/modules/sessao/sessao_store.dart';

class SessaoModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(SessaoStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HistoricoPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/historico',
      child: (context) => const HistoricoPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/agendamento',
      child: (context) => const AgendamentoPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/avaliar',
      child: (context) => const AvaliarPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/check_in',
      child: (context) => const CheckInPage(),
      transition: defaultTransitonType,
    );
    // r.child('/contratos', child: (context) => const ContratosPage());
  }
}
