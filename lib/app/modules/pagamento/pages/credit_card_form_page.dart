// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:pollos_digital/app/mixins/form_validations_mixin.dart';
// import 'package:pollos_digital/app/modules/pagamento/pagamentos_store.dart';
// import 'package:pollos_digital/app/shared/colors.dart';
// import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
// import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
// import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
// import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
// import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
// import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';

// class CreditCardFormPage extends StatefulWidget {
//   final int? creditCardId;
//   const CreditCardFormPage({super.key, this.creditCardId});
//   @override
//   CreditCardFormPageState createState() => CreditCardFormPageState();
// }

// class CreditCardFormPageState extends State<CreditCardFormPage>
//     with FormValidationsMixin {
//   final PagamentosStore _store = Modular.get<PagamentosStore>();
//   late final Future<void> _future;

//   late final String pageTitle;

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final cardNumberFormatter = MaskTextInputFormatter(
//     mask: '#### #### #### ####',
//     filter: {"#": RegExp(r'[0-9]')},
//     type: MaskAutoCompletionType.lazy,
//   );

//   final dateFormatter = MaskTextInputFormatter(
//     mask: '##/##',
//     filter: {"#": RegExp(r'[0-9]')},
//     type: MaskAutoCompletionType.lazy,
//   );

//   final cvvFormatter = MaskTextInputFormatter(
//     mask: '###',
//     filter: {"#": RegExp(r'[0-9]')},
//     type: MaskAutoCompletionType.lazy,
//   );

//   @override
//   void initState() {
//     pageTitle =
//         (widget.creditCardId != null) ? 'EDITAR CARTÃO' : 'CRIAR CARTÃO';

//     _future = Future.wait([_store.initCreditCardForm(widget.creditCardId)]);

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _future,
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         return SimpleScaffoldWidget(
//           title: pageTitle,
//           bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
//           body: Observer(
//             builder: (_) {
//               if (snapshot.connectionState == ConnectionState.done &&
//                   snapshot.hasData) {
//                 return _body();
//               } else {
//                 return _loadingBody();
//               }
//             },
//           ),
//         );
//       },
//     );
//   }

//   Widget _loadingBody() {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: List.generate(
//           6,
//           (index) => Column(
//             children: [
//               ShimmerWidget(width: 90.w, height: 6.h),
//               DividerWidget(height: 1.h),
//               ShimmerWidget(width: 90.w, height: 2.h),
//               DividerWidget(height: 1.h),
//               ShimmerWidget(width: 90.w, height: 2.h),
//               DividerWidget(height: 3.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _body() {
//     return Column(
//       children: [
//         DividerWidget(height: 2.h),
//         _card(),
//         DividerWidget(height: 2.h),
//         _form(),
//         DividerWidget(height: 2.h),
//       ],
//     );
//   }

//   Widget _card() {
//     return Observer(builder: (_) {
//       return CreditCardWidget(
//         cardNumber: _store.cardNumber,
//         expiryDate: _store.expiryDate,
//         cardHolderName: _store.cardHolderName,
//         cvvCode: _store.cvvCode,
//         showBackView: _store.cvvFocused,
//         obscureCardCvv: false,
//         isHolderNameVisible: true,
//         labelCardHolder: 'NOME',
//         cardBgColor: grey,
//         onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
//       );
//     });
//   }

//   Widget _form() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 5.w),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             InputWidget(
//               label: 'Nº do cartão',
//               keyboardType: TextInputType.number,
//               validator: (v) => combine([
//                 () => notEmpty(v),
//               ]),
//               inputFormatters: [cardNumberFormatter],
//               placeholder: 'XXXX XXXX XXXX XXXX',
//               onChanged: _store.setCardNumber,
//             ),
//             DividerWidget(height: 2.h),
//             InputWidget(
//               label: 'Nome no cartão',
//               keyboardType: TextInputType.name,
//               validator: (v) => combine([
//                 () => notEmpty(v),
//               ]),
//               onChanged: _store.setCardHolderName,
//             ),
//             DividerWidget(height: 2.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 40.w,
//                   child: InputWidget(
//                     label: 'Data de venc.',
//                     keyboardType: TextInputType.number,
//                     validator: (v) => combine([
//                       () => notEmpty(v),
//                     ]),
//                     inputFormatters: [dateFormatter],
//                     placeholder: 'XX/XX',
//                     onChanged: _store.setExpiryDate,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 35.w,
//                   child: InputWidget(
//                     label: 'CVV',
//                     keyboardType: TextInputType.number,
//                     validator: (v) => combine([
//                       () => notEmpty(v),
//                       () => nChars(3, v),
//                     ]),
//                     inputFormatters: [cvvFormatter],
//                     placeholder: 'XXX',
//                     onChanged: _store.setCvvCode,
//                   ),
//                 ),
//               ],
//             ),
//             DividerWidget(height: 5.h),
//             ButtonWidget.filled(
//               onPressed: () async {
//                 _store.setCvvFocused(false);

//                 if (!_formKey.currentState!.validate()) return;

//                 bool status = await _store.saveCard();

//                 if (!mounted) return;

//                 if (status) {
//                   await showSuccessBottomSheet(
//                     context,
//                     message: 'SALVO COM SUCESSO',
//                     onPressed: () {
//                       Modular.to.pop();
//                       Modular.to.pop();
//                     },
//                     onClose: () {
//                       Modular.to.pop();
//                       Modular.to.pop();
//                     },
//                   );
//                 } else {
//                   showErrorBottomSheet(
//                     context,
//                     message: 'OCORREU UM ERRO AO TENTAR SALVAR O CARTÃO',
//                   );
//                 }
//               },
//               backgroundColor: primary,
//               title: 'SALVAR',
//               textColor: white,
//             ),
//             DividerWidget(height: 5.h),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _store.resetCreditCardForm();

//     super.dispose();
//   }
// }
