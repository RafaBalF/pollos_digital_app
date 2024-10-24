import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/enums/button_sizes.enum.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputCardWidget extends StatefulWidget {
  final ProjetoStore store;

  const InputCardWidget({super.key, required this.store});

  @override
  State<InputCardWidget> createState() => _InputCardWidgetState();
}

class _InputCardWidgetState extends State<InputCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        width: 90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0)),
                // color: Colors.grey[400],
                color: focus,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cartões',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: Colors.white),
                    ),
                    ButtonWidget.outlined(
                      textColor: Colors.white,
                      onPressed: () {
                        showCustomBottomSheet(
                            context, 'ADICIONAR CARTÃO', _addCard(null));
                      },
                      title: 'Adicionar',
                      buttonSize: ButtonSize.small,
                      width: 150,
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                color: Colors.grey[100],
                // color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: widget.store.projetoModel!.card!.isEmpty ? 1.h : 40.h,
                  width: 100.w,
                  child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.store.projetoModel?.card?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Dismissible(
                          key: Key(
                              widget.store.projetoModel?.card?[index].titulo),
                          background: Container(
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.red,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textWidget('Apagar',
                                      color: Colors.white,
                                      textAlign: TextAlign.center,
                                      fontSize: 20),
                                  textWidget('Apagar',
                                      color: Colors.white,
                                      textAlign: TextAlign.center,
                                      fontSize: 20),
                                ],
                              ),
                            ),
                          ),
                          direction: DismissDirection.vertical,
                          onDismissed: (direction) {
                            widget.store.deletCard(
                                widget.store.projetoModel?.card?[index]);
                          },
                          child: GestureDetector(
                            onTap: () {
                              showCustomBottomSheet(
                                  context, 'ADICIONAR CARTÃO', _addCard(index));
                            },
                            child: Container(
                              height: 300,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                // color: Colors.grey[400],
                                color: Colors.red[100],
                              ),
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Título: ',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: widget.store.projetoModel
                                              ?.card?[index].titulo,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 0,
                                    color: Colors.red[200],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Texto: ',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: widget.store.projetoModel
                                              ?.card?[index].texto,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  _addCard(index) {
    if (index != null) {
      widget.store.cardTitulo = widget.store.projetoModel?.card?[index].titulo;
      widget.store.cardTexto = widget.store.projetoModel?.card?[index].texto;
    } else {
      widget.store.cardTitulo = null;
      widget.store.cardTexto = null;
    }
    return Column(
      children: [
        InputWidget(
          label: 'Título',
          onChanged: widget.store.setCardTitulo,
          value: widget.store.cardTitulo,
          maxLines: 2,
          minLines: 2,
        ),
        const DividerWidget(height: 30),
        InputWidget(
          label: 'Texto',
          onChanged: widget.store.setCardTexto,
          value: widget.store.cardTexto,
          maxLines: 7,
          minLines: 7,
        ),
        const DividerWidget(height: 30),
        ButtonWidget.filled(
          width: 60.w,
          onPressed: () {
            widget.store.addCard(
                widget.store.cardTitulo, widget.store.cardTexto, index);
            Modular.to.pop();
          },
          title: 'SALVAR',
          backgroundColor: focus,
        )
      ],
    );
  }
}
