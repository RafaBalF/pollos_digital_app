import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/faq/faq_page.dart';
import 'package:pollos_digital/app/modules/faq/faq_store.dart';

class FAQModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(FAQStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const FAQPage(),
      transition: defaultTransitonType,
    );
  }
}
