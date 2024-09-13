import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/pagamento/pagamentos_page.dart';
import 'package:pollos_digital/app/modules/pagamento/pagamentos_store.dart';
//import 'package:pollos_digital/app/modules/pagamento/pages/credit_card_form_page.dart';
import 'package:pollos_digital/app/modules/pagamento/pages/credit_card_page.dart';
import 'package:pollos_digital/app/modules/pagamento/pages/my_cards_page.dart';
import 'package:pollos_digital/app/modules/pagamento/pages/pagamento_page.dart';
import 'package:pollos_digital/app/modules/pagamento/pages/pix_page.dart';

class PagamentoModule extends Module {
  @override
  void binds(i) {
    // Pages
    i.addLazySingleton(PagamentosStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const PagamentosPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/pagamento',
      child: (context) => const PagamentoPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/pix',
      child: (context) => const PixPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/credit-card',
      child: (context) => const CreditCardPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/my-cards',
      child: (context) => const MyCardsPage(),
      transition: defaultTransitonType,
    );
    // r.child(
    //   '/credit-card-form',
    //   child: (context) => CreditCardFormPage(creditCardId: r.args.data),
    //   transition: defaultTransitonType,
    // );
  }
}
