import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:pollos_digital/app/models/payment.model.dart';
import 'package:pollos_digital/app/modules/pagamento/pagamentos_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/interfaces/simple_selectable_card.interface.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PagamentosPage extends StatefulWidget {
  const PagamentosPage({super.key});
  @override
  PagamentosPageState createState() => PagamentosPageState();
}

class PagamentosPageState extends State<PagamentosPage> {
  final PagamentosStore _store = Modular.get<PagamentosStore>();
  late final Future<void> _future;
  final ScrollController scrollController = ScrollController();

  final DateFormat dateFormatter = DateFormat("dd/MM/yyyy");
  final NumberFormat currencyFormatter = NumberFormat("#,##0.00", "pt_BR");

  final pago = const Color(0XFFB8F8E5);
  final pagoCard = const Color(0XFF72DCBC);
  final atrasado = const Color(0xFFFBDDDD);
  final atrasadoCard = const Color(0xFFFF7E7E);
  final antecipar = const Color(0XFFF0F0F0);
  final anteciparCard = const Color(0XFFC7C7C7);
  final padrao = const Color(0XFF2B2B2B);
  final precoDesconto = const Color(0XFF00C5A9);

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
            title: 'PAGAMENTOS',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return _body();
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
        _filter(),
        Observer(builder: (_) {
          return Column(
            children: _store.payments.map((p) => _paymentCard(p)).toList(),
          );
        }),
        DividerWidget(height: 10.h),
        Observer(builder: (_) {
          return ButtonWidget.filled(
            onPressed: () {
              Modular.to.pushNamed('/pagamentos/pagamento');
            },
            backgroundColor: primary,
            title: 'PAGAR',
            textColor: white,
            disabled: _store.selectedPayments.isEmpty,
          );
        }),
      ],
    );
  }

  Widget _filter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textWidget('Exibir somente em aberto', style: label()),
        Observer(builder: (_) {
          return Switch(
            value: _store.onlyOpened,
            onChanged: _store.setOnlyOpened,
          );
        }),
      ],
    );
  }

  Widget _paymentCard(SimpleSelectableCard<PaymentModel> payment) {
    return Observer(builder: (_) {
      return Visibility(
        visible: (_store.onlyOpened) ? payment.value.statusCode != 0 : true,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Container(
            decoration: BoxDecoration(
              color: _getMainColor(payment.value.statusCode),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 15.w,
                      child: (payment.value.statusCode != 0)
                          ? Center(
                              child: Checkbox(
                                value: payment.selected,
                                onChanged: (b) => _store.selectPayment(payment),
                              ),
                            )
                          : const SizedBox(),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textWidget(
                                dateFormatter.format(payment.value.date!),
                                style: label(),
                              ),
                              _card(payment.value.statusCode),
                            ],
                          ),
                          textWidget(
                            (payment.value.parcela != null)
                                ? 'Parcela ${payment.value.parcela}'
                                : 'PELO APP É MAIS BARATO',
                            style: text(),
                          ),
                          _price(payment.value),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Color _getMainColor(int? statusCode) {
    switch (statusCode) {
      case 0:
        return pago;
      case 1:
        return atrasado;
      case 2:
        return antecipar;
      default:
        return padrao;
    }
  }

  Widget _card(int? statusCode) {
    late Color color;
    late String text;

    switch (statusCode) {
      case 0:
        color = pagoCard;
        text = 'PAGO';
        break;
      case 1:
        color = atrasadoCard;
        text = 'ATRASADO';
        break;
      case 2:
        color = anteciparCard;
        text = 'ANTECIPAR';
        break;
      default:
        color = padrao;
        text = '';
        break;
    }

    return Container(
      height: 2.5.h,
      width: 25.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5.w),
        child: textWidget(
          text,
          textAlign: TextAlign.center,
          style: label(color: white),
        ),
      ),
    );
  }

  Widget _price(PaymentModel payment) {
    if (payment.oldPrice == null) {
      return textWidget(
        "R\$ ${currencyFormatter.format(payment.price)}",
        style: headTitle(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          "DE R\$ ${currencyFormatter.format(payment.oldPrice)}",
          style: modalDetails(textDecoration: TextDecoration.lineThrough),
        ),
        textWidget(
          "POR R\$ ${currencyFormatter.format(payment.price)}",
          style: headTitle(color: precoDesconto),
        )
      ],
    );
  }

  @override
  void dispose() {
    _store.reset();

    scrollController.dispose();

    super.dispose();
  }
}
