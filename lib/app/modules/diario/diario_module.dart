import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/diario/diario_page.dart';
import 'package:pollos_digital/app/modules/diario/diario_store.dart';
import 'package:pollos_digital/app/modules/diario/primeira_sessao/antes_primeira_sessao_page.dart';
import 'package:pollos_digital/app/modules/diario/primeira_sessao/primeira_sessao_page.dart';

class DiarioModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DiarioStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const DiarioPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/antes-primeira-sessao',
      child: (context) => const AntesPrimeiraSessaoPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/primeira-sessao',
      child: (context) => const PrimeiraSessaoPage(),
      transition: defaultTransitonType,
    );
  }
}
