import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/curriculo/curriculo_page.dart';
import 'package:pollos_digital/app/modules/curriculo/curriculo_store.dart';
import 'package:pollos_digital/app/modules/curriculo/pages/curriculos_modelos_page.dart';
import 'package:pollos_digital/app/modules/curriculo/pages/dados_resultados_page.dart';
import 'package:pollos_digital/app/modules/curriculo/pages/modelos_criados_page.dart';

class CurriculoModule extends Module {
  @override
  void binds(i) {
    // Pages
    i.addLazySingleton(CurriculoStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const CurriculoPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/dados-resultados',
      child: (context) => const DadosResultadosPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/curriculos-modelos',
      child: (context) => const CurriculosModelosPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/modelos-criados',
      child: (context) => const ModelosCriadosPage(),
      transition: defaultTransitonType,
    );
  }
}
