import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/profile/pages/configuracoes_page.dart';
import 'package:pollos_digital/app/modules/profile/pages/contrato_page.dart';
import 'package:pollos_digital/app/modules/profile/pages/contratos_page.dart';
import 'package:pollos_digital/app/modules/profile/pages/dados_pessoais_page.dart';
import 'package:pollos_digital/app/modules/profile/pages/politicas_de_privacidade_page.dart';
import 'package:pollos_digital/app/modules/profile/pages/redefinir_senha_page.dart';
import 'package:pollos_digital/app/modules/profile/pages/termos_contrato_page.dart';
import 'package:pollos_digital/app/modules/profile/profile_page.dart';
import 'package:pollos_digital/app/modules/profile/profile_store.dart';

class ProfileModule extends Module {
  @override
  void binds(i) {
    // Pages
    i.addLazySingleton(ProfileStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const ProfilePage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/dados-pessoais',
      child: (context) => const DadosPessoaisPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/enderecos',
      child: (context) => const DadosPessoaisPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/configuracoes',
      child: (context) => const ConfiguracoesPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/politicas-de-privacidade',
      child: (context) => const PoliticasDePrivacidadePage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/redefinir-senha',
      child: (context) => const RedefinirSenhaPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/contratos',
      child: (context) => const ContratosPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/contrato',
      child: (context) => ContratoPage(contrato: r.args.data),
      transition: defaultTransitonType,
    );
    r.child(
      '/termos-contrato',
      child: (context) => TermosContratoPage(contrato: r.args.data),
      transition: defaultTransitonType,
    );
  }
}
