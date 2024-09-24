import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_page.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/modules/projeto/pages/curriculos_modelos_page.dart';
import 'package:pollos_digital/app/modules/projeto/pages/dados_resultados_page.dart';
import 'package:pollos_digital/app/modules/projeto/pages/modelos_criados_page.dart';

class CurriculoModule extends Module {
  @override
  void binds(i) {
    // Pages
    i.addLazySingleton(ProjetoStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const ProjetoPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/dados-resultados',
      child: (context) => const DadosResultadosPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/curriculos-modelos',
      child: (context) => const ProjetosModelosPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/modelos-criados',
      child: (context) => const ProjetosCriadosPage(),
      transition: defaultTransitonType,
    );
  }
}
