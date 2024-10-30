import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/projeto/pages/details_modelos_page.dart';
import 'package:pollos_digital/app/modules/projeto/pages/record_audio_page.dart';
import 'package:pollos_digital/app/modules/projeto/pages/select_modelo_page.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/modules/projeto/projetos_modelos_page.dart';
import 'package:pollos_digital/app/modules/projeto/pages/dados_resultados_page.dart';
import 'package:pollos_digital/app/modules/projeto/pages/modelos_criados_page.dart';

class ProjetoModule extends Module {
  @override
  void binds(i) {
    // Pages
    i.addLazySingleton(ProjetoStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const ProjetosModelosPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/dados-resultados',
      child: (context) => const DadosResultadosPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/select-modelo',
      child: (context) => const SelectModeloPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/record-audio',
      child: (context) => const RecordPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/projetos-criados',
      child: (context) => const ProjetosCriadosPage(),
      transition: defaultTransitonType,
    );

    r.child(
      '/details-modelo',
      child: (context) => const DetaislModelosPage(),
      transition: defaultTransitonType,
    );
  }
}
