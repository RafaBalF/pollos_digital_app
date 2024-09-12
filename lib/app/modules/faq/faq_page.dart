import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/faq/faq_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/accordion_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});
  @override
  FAQPageState createState() => FAQPageState();
}

class FAQPageState extends State<FAQPage> {
  final FAQStore _store = Modular.get<FAQStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.init()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'FAQ',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Observer(builder: (_) {
                    return _body();
                  });
                } else {
                  return _loadingBody();
                }
              },
            ));
      },
    );
  }

  Widget _loadingBody() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          6,
          (index) => Column(
            children: [
              ShimmerWidget(width: 90.w, height: 6.h),
              DividerWidget(height: 1.h),
              ShimmerWidget(width: 90.w, height: 2.h),
              DividerWidget(height: 1.h),
              ShimmerWidget(width: 90.w, height: 2.h),
              DividerWidget(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        textWidget('Tire suas dúvidas sobre os procedimentos'),
        DividerWidget(height: 2.h),
        _tile(
          'É muito caro o tratamento?',
          """Foi-se a época que depilação de laser era cara. A LaserFast veio tornar acessível este tratamento à todas as clientes, fornecendo preço justo e condição de pagamento facilitada.

Além disso, o custo é super compensatório uma vez que lâminas, ceras e outros métodos requerem mensalmente uma manutenção, diferentemente do laser que tem durabilidade muito maior.""",
        ),
        DividerWidget(height: 2.h),
        _tile(
          'Depilação a laser dói?',
          """
A LaserFast possui o laser mais moderno e tecnológico do mercado, que garante uma depilação muito mais confortável e praticamente indolor em algumas áreas.""",
        ),
        DividerWidget(height: 2.h),
        _tile(
          'Quanto tempo leva uma sessão?',
          """
Graças ao nosso laser super moderno, a área de aplicação é amplamente atingida a cada disparo. Uma sessão pode durar entre 5 minutos (como é o caso das axilas) até 30 minutos (aplicação de pernas inteiras).
""",
        ),
      ],
    );
  }

  Widget _tile(String title, String details) {
    return AccordionWidget(
      label: title,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Text(details),
      ),
      titleStyle: h2(color: primary),
      initiallyExpanded: true,
    );
  }

  @override
  void dispose() {
    _store.reset();

    super.dispose();
  }
}
