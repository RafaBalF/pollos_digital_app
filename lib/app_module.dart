import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/guards/auth.guard.dart';
import 'package:pollos_digital/app/modules/auth/auth_module.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_module.dart';
import 'package:pollos_digital/app/modules/diario/diario_module.dart';
import 'package:pollos_digital/app/modules/faq/faq_module.dart';
import 'package:pollos_digital/app/modules/home/home_module.dart';
import 'package:pollos_digital/app/modules/indicar/indicar_module.dart';
import 'package:pollos_digital/app/modules/launch/launch_module.dart';
import 'package:pollos_digital/app/modules/notificacoes/notificacoes_module.dart';
import 'package:pollos_digital/app/modules/pagamento/pagamentos_module.dart';
import 'package:pollos_digital/app/modules/parceiros/parceiros_module.dart';
import 'package:pollos_digital/app/modules/profile/profile_module.dart';
import 'package:pollos_digital/app/modules/sessao/sessao_module.dart';
import 'package:pollos_digital/loading_store.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(LoadingStore.new);
  }

  @override
  void routes(r) {
    r.module(
      '/',
      module: LaunchModule(),
      // module: ProjetoModule(),
      transition: defaultTransitonType,
    );
    r.module(
      '/projeto',
      module: ProjetoModule(),
      transition: defaultTransitonType,
    );
    r.module(
      '/auth',
      module: AuthModule(),
      transition: defaultTransitonType,
    );
    r.module(
      '/home',
      module: HomeModule(),
      transition: defaultTransitonType,
      guards: [AuthGuard()],
    );
    r.module(
      '/sessao',
      module: SessaoModule(),
      transition: defaultTransitonType,
      guards: [AuthGuard()],
    );
    r.module(
      '/pagamentos',
      module: PagamentoModule(),
      transition: defaultTransitonType,
      guards: [AuthGuard()],
    );
    r.module(
      '/profile',
      module: ProfileModule(),
      transition: defaultTransitonType,
      guards: [AuthGuard()],
    );
    r.module(
      '/parceiros',
      module: ParceirosModule(),
      transition: defaultTransitonType,
      guards: [AuthGuard()],
    );
    r.module(
      '/faq',
      module: FAQModule(),
      transition: defaultTransitonType,
    );
    r.module(
      '/indicar',
      module: IndicarModule(),
      transition: defaultTransitonType,
      guards: [AuthGuard()],
    );
    r.module(
      '/diario',
      module: DiarioModule(),
      transition: defaultTransitonType,
      guards: [AuthGuard()],
    );
    r.module(
      '/notificacoes',
      module: NotificacoesModule(),
      transition: defaultTransitonType,
      guards: [AuthGuard()],
    );
  }
}
