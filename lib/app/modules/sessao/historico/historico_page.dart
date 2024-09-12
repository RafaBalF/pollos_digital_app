import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pollos_digital/app/models/evento_sessao.model.dart';
import 'package:pollos_digital/app/models/excluir_sessao.model.dart';
import 'package:pollos_digital/app/models/sessao.model.dart';
import 'package:pollos_digital/app/modules/sessao/models/info_formatada_sessao.model.dart';
import 'package:pollos_digital/app/modules/sessao/sessao_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/services/message.service.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divided_card_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});
  @override
  HistoricoPageState createState() => HistoricoPageState();
}

class HistoricoPageState extends State<HistoricoPage> {
  final SessaoStore _store = Modular.get<SessaoStore>();
  late final Future<void> _future;
  final ScrollController scrollController = ScrollController();
  final MessageService _messageService = MessageService();

  final DateFormat eventoDateFormatter = DateFormat("dd/MM/yyyy 'as' HH:mm");

  final realizada = const Color(0XFF65A491);
  final falta = const Color(0xFFCB91D1);
  final agendada = const Color(0XFFDDD2D2);
  final andamento = const Color(0XFFE8C691);
  final confirmada = const Color(0XFF817FF0);
  final padrao = const Color(0XFF2B2B2B);

  @override
  void initState() {
    _future = Future.wait([_store.initHistory()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'HISTÓRICO DE SESSÕES',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            actions: [
              ButtonWidget.outlinedIcon(
                borderColor: background,
                onPressed: _reloadHistory,
                iconData: Icons.refresh,
              )
            ],
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return _store.history.isEmpty
                      ? _nenhumaSessao()
                      : Column(
                          children: _store.history
                              .map((i) => _sessionCard(i))
                              .toList(),
                        );
                } else {
                  return _loadingBody();
                }
              },
            ));
      },
    );
  }

  void _reloadHistory() async {
    await _store.getHistory();

    if (!mounted) return;

    _messageService.showMsg(
      context,
      "Histórico recarregado com sucesso",
      duration: 2,
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

  Widget _nenhumaSessao() {
    return Column(
      children: [
        DividerWidget(height: 5.h),
        SvgPicture.asset(
          'assets/icons/svg/document.svg',
          height: 14.h,
        ),
        DividerWidget(height: 5.h),
        textWidget(
          'Parece que você ainda não realizou nenhuma sessão com a gente!',
          textAlign: TextAlign.center,
          style: h2(),
        ),
        DividerWidget(height: 5.h),
        ButtonWidget.filled(
          onPressed: () => Modular.to.pushNamed('/sessao/agendamento'),
          title: 'AGENDAR',
        ),
      ],
    );
  }

  Widget _sessionCard(EventoSessaoModel evento) {
    final info = _getInfoEventoSessao(evento);
    final assunto = evento.assunto != null
        ? evento.assunto!.replaceAll("APP LF- ", "")
        : "";

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10.w,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: info.cor,
                  ),
                  child: const SizedBox(),
                ),
              ),
              SizedBox(width: 2.5.w),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                          info.status,
                          style: label(),
                        ),
                        textWidget(
                          eventoDateFormatter.format(evento.dataHoraIncio!),
                          style: small(),
                        ),
                      ],
                    ),
                    DividerWidget(height: 0.5.h),
                    textWidget(assunto, style: small()),
                    DividerWidget(height: 0.5.h),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100.w,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              info.widget,
            ]),
          ),
        ],
      ),
    );
  }

  InfoFormatadaSessao _getInfoEventoSessao(EventoSessaoModel evento) {
    const emptyWidget = SizedBox();
    switch (evento.status) {
      case "Realizado":
        return InfoFormatadaSessao(
          cor: realizada,
          status: "Sessão realizada",
          widget: emptyWidget,
        );
      case "Falta":
        return InfoFormatadaSessao(
          cor: falta,
          status: "Falta",
          widget: emptyWidget,
        );
      case "Agendado":
        return InfoFormatadaSessao(
          cor: agendada,
          status: "Sessão agendada",
          widget: GestureDetector(
            onTap: () => _edit(evento),
            child: Icon(
              size: 4.h,
              Icons.edit_outlined,
              color: black,
            ),
          ),
        );
      case "Andamento":
        return InfoFormatadaSessao(
          cor: andamento,
          status: "Sessão em andamento",
          widget: emptyWidget,
        );
      case "Confirmado":
        return InfoFormatadaSessao(
          cor: confirmada,
          status: "Sessão confirmada",
          widget: emptyWidget,
          // widget: _cardBtn(
          //   confirmada,
          //   'CHECK-IN',
          //   () {
          //     _store.setSessaoParaCheckIn(evento);
          //     Modular.to.pushNamed('/sessao/check_in');
          //   },
          // ),
        );
      default:
        return InfoFormatadaSessao(
          cor: padrao,
          status: "",
          widget: const SizedBox(),
        );
    }
  }

  // Widget _cardBtn(Color color, String label, void Function()? onTap) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Container(
  //       height: 2.5.h,
  //       decoration: BoxDecoration(
  //         color: color,
  //         borderRadius: BorderRadius.circular(50),
  //       ),
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 2.5.w),
  //         child: textWidget(label, color: white),
  //       ),
  //     ),
  //   );
  // }

  void _edit(EventoSessaoModel evento) {
    showCustomBottomSheet(
      context,
      'AGENDA',
      Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
            child: DividedCardWidget(
              header: 'Resumo:',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textWidget(
                        evento.status,
                        style: label(),
                      ),
                      textWidget(
                        eventoDateFormatter.format(evento.dataHoraIncio!),
                        style: small(),
                      ),
                    ],
                  ),
                  DividerWidget(height: 0.5.h),
                  textWidget(
                    evento.assunto,
                    style: small(),
                  ),
                  DividerWidget(height: 0.5.h),
                ],
              ),
            ),
          ),
          DividerWidget(height: 5.h),
          ButtonWidget.filled(
            onPressed: () async {
              Modular.to.pop();

              final r = await _store.confirmarAgendamento(evento);

              if (!mounted) return;

              showBaseModalBottomSheet(context, r);
            },
            title: 'CONFIRMAR',
          ),
          DividerWidget(height: 2.h),
          ButtonWidget.outlined(
            onPressed: () {
              SessaoModel? sessao = _store.encontrarSessaoPorEvento(evento);

              if (sessao == null) return;

              final reagendada = ExcluirSessaoModel(
                codigoComanda: sessao.codigoComanda,
                data: evento.dataHoraIncio,
              );

              _store.setSessaoSendoReagendada(reagendada);

              Modular.to.pop();
              Modular.to.pushNamed('/sessao/agendamento');
            },
            title: 'REAGENDAR',
          ),
          DividerWidget(height: 2.h),
        ],
      ),
    );
  }

  // void _avaliar(EventoSessaoModel evento) {
  //   showCustomBottomSheet(
  //     context,
  //     'AGENDA',
  //     Column(
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
  //           child: DividedCardWidget(
  //             header: 'Resumo:',
  //             content: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     textWidget(
  //                       evento.status,
  //                       style: label(),
  //                     ),
  //                     textWidget(
  //                       eventoDateFormatter.format(evento.dataHoraIncio!),
  //                       style: small(),
  //                     ),
  //                   ],
  //                 ),
  //                 DividerWidget(height: 0.5.h),
  //                 textWidget(
  //                   evento.assunto,
  //                   style: small(),
  //                 ),
  //                 DividerWidget(height: 0.5.h),
  //               ],
  //             ),
  //           ),
  //         ),
  //         DividerWidget(height: 5.h),
  //         ButtonWidget.filled(
  //           onPressed: () {
  //             _store.setSessaoSendoAvaliada(evento);
  //             Modular.to.pop();
  //             Modular.to.pushNamed('/sessao/avaliar');
  //             // Modular.to.pop();
  //             // Modular.to.pushNamed('/indicar/');
  //           },
  //           title: 'AVALIAR',
  //         ),
  //         DividerWidget(height: 2.h),
  //       ],
  //     ),
  //   );
  // }

  @override
  void dispose() {
    _store.resetHistory();

    scrollController.dispose();

    super.dispose();
  }
}
