import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/models/notificacao.model.dart';
import 'package:pollos_digital/app/modules/notificacoes/notificacoes_store.dart';
import 'package:pollos_digital/app/modules/notificacoes/widgets/notificacao_card_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificacoesPage extends StatefulWidget {
  const NotificacoesPage({super.key});
  @override
  NotificacoesPageState createState() => NotificacoesPageState();
}

class NotificacoesPageState extends State<NotificacoesPage> {
  final NotificacoesStore _store = Modular.get<NotificacoesStore>();
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
            title: 'NOTIFICAÇÕES',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Observer(builder: (_) {
                    return Column(
                      children: _store.notificacoes
                          .map((i) => NotificacaoCard(
                                notificacao: i,
                                onClick: (notificacao) =>
                                    _clickNotificacao(notificacao),
                              ))
                          .toList(),
                    );
                  });
                } else {
                  return _loadingBody();
                }
              },
            ));
      },
    );
  }

  Future<void> _clickNotificacao(NotificacaoModel notificacao) async {
    if (!notificacao.lido!) _store.lerNotificacao(notificacao);
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

  @override
  void dispose() {
    _store.reset();

    super.dispose();
  }
}
