import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pollos_digital/app/models/credit_card.model.dart';
import 'package:pollos_digital/app/modules/pagamento/pagamentos_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({super.key});
  @override
  MyCardsPageState createState() => MyCardsPageState();
}

class MyCardsPageState extends State<MyCardsPage> {
  final PagamentosStore _store = Modular.get<PagamentosStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.initMyCards()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
          title: 'MEUS CARTÕES',
          bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
          body: Observer(
            builder: (_) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Observer(builder: (_) {
                  return (_store.myCards.isEmpty)
                      ? _emptyBody()
                      : _filledBody();
                });
              } else {
                return _loadingBody();
              }
            },
          ),
        );
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

  Widget _emptyBody() {
    return Column(
      children: [
        DividerWidget(height: 10.h),
        SvgPicture.asset(
          'assets/images/pagamentos/cards.svg',
          height: 12.h,
        ),
        DividerWidget(height: 1.h),
        textWidget(
          'Sem cartões cadastrados',
          style: h2(color: grey),
        ),
        DividerWidget(height: 10.h),
        ButtonWidget.filled(
          onPressed: () {
            Modular.to.pushNamed('/pagamentos/credit-card-form');
          },
          backgroundColor: primary,
          title: 'CADASTRAR NOVO CARTÃO',
          textColor: white,
        ),
      ],
    );
  }

  Widget _filledBody() {
    return Column(
      children: [
        Observer(builder: (_) {
          return Column(
            children: _store.myCards.map((c) => _card(c)).toList(),
          );
        }),
        DividerWidget(height: 5.h),
        ButtonWidget.outlined(
          onPressed: () {
            Modular.to.pushNamed('/pagamentos/credit-card-form');
          },
          borderColor: darkGrey,
          title: 'CADASTRAR NOVO CARTÃO',
          textColor: darkGrey,
        ),
        DividerWidget(height: 2.h),
        _payBtn(),
        DividerWidget(height: 5.h),
      ],
    );
  }

  Widget _payBtn() {
    return (_store.selectedPayments.isNotEmpty)
        ? ButtonWidget.filled(
            onPressed: () async {
              final bool r = await _store.payWithCreditCard();

              if (!mounted) return;

              if (r) {
                showSuccessBottomSheet(
                  context,
                  message: 'PAGAMENTO EFETUADO COM SUCESSO',
                  onPressed: () {
                    Modular.to.pop();
                    Modular.to.pop();
                    Modular.to.pop();
                  },
                  onClose: () {
                    Modular.to.pop();
                    Modular.to.pop();
                    Modular.to.pop();
                  },
                  dismissable: false,
                );
              } else {
                showErrorBottomSheet(
                  context,
                  message: 'OCORREU UM ERRO AO TENTAR EFETUAR O PAGAMENTO',
                );
              }
            },
            backgroundColor: primary,
            title: 'SELECIONAR CARTÃO',
            textColor: white,
          )
        : const SizedBox();
  }

  Widget _card(CreditCardModel card) {
    String number = card.numero!;

    String start = "${number[0]}${number[1]}${number[2]}${number[3]}";
    String end = "${number[18]}${number[17]}${number[16]}${number[15]}";

    String displayNumber = "$start **** **** $end";

    Color borderColor = grey;
    Color iconColor = darkerGrey;

    if (_store.selectedCard == card) {
      borderColor = iconColor = primary;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        child: RadioListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          value: card,
          groupValue: _store.selectedCard,
          onChanged: _store.selectCard,
          title: textWidget(displayNumber),
          secondary: Icon(Icons.credit_card, size: 24.sp, color: iconColor),
          subtitle: Flex(
            direction: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  showDeleteCardModal(displayNumber, card.id);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: textWidget(
                    'Excluir',
                    style: text(
                      color: primary,
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showDeleteCardModal(String displayNumber, int? cardId) {
    showCustomBottomSheet(context, 'CARTÃO DE CRÉDITO', Observer(builder: (_) {
      return SizedBox(
        width: 90.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DividerWidget(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: textWidget(
                'DESEJA REALMENTE EXCLUIR O CARTÃO?',
                style: h2(),
                textAlign: TextAlign.center,
              ),
            ),
            DividerWidget(height: 5.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: primary),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.credit_card,
                    size: 30.sp,
                    color: primary,
                  ),
                  SizedBox(width: 10.w),
                  textWidget(displayNumber, style: large()),
                ],
              ),
            ),
            DividerWidget(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40.w,
                  child: ButtonWidget.outlined(
                    borderColor: darkGrey,
                    onPressed: () {
                      Modular.to.pop();
                    },
                    textColor: darkGrey,
                    title: 'CANCELAR',
                  ),
                ),
                SizedBox(
                  width: 40.w,
                  child: ButtonWidget.filled(
                    backgroundColor: primary,
                    onPressed: () async {
                      final bool r = await _store.deleteCard(cardId);

                      if (!mounted) return;

                      Modular.to.pop();

                      if (r) {
                        showSuccessBottomSheet(
                          context,
                          message: 'CARTÃO EXCLUÍDO COM SUCESSO',
                        );
                      } else {
                        showErrorBottomSheet(
                          context,
                          message: 'OCORREU UM ERRO AO TENTAR EXCLUIR O CARTÃO',
                        );
                      }
                    },
                    textColor: white,
                    title: 'EXCLUIR',
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }));
  }

  @override
  void dispose() {
    _store.resetMyCards();

    super.dispose();
  }
}
