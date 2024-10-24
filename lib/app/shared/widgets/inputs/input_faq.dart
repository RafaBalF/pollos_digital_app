import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/enums/button_sizes.enum.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputFaqWidget extends StatefulWidget {
  final ProjetoStore store;

  const InputFaqWidget({super.key, required this.store});

  @override
  State<InputFaqWidget> createState() => _InputFaqWidgetState();
}

class _InputFaqWidgetState extends State<InputFaqWidget> {
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
                      'Dúvidas Frequentes',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: Colors.white),
                    ),
                    ButtonWidget.outlined(
                      textColor: Colors.white,
                      onPressed: () {
                        showCustomBottomSheet(context,
                            'ADICIONAR PERGUNTA PARA FAQ', _addFaq(null));
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
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.store.projetoModel?.faq?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showCustomBottomSheet(
                                  context,
                                  'ADICIONAR PERGUNTA PARA FAQ',
                                  _addFaq(index));
                            },
                            child: ListTile(
                              title: Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                    widget.store.projetoModel?.faq?[index]
                                        .pergunta,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  widget.store.deletFaq(
                                      widget.store.projetoModel?.faq?[index]);
                                },
                              ),
                            ),
                          ),
                          const Divider(height: 0),
                        ],
                      );
                    }),
              ),
            )
          ],
        ),
      );
    });
  }

  _addFaq(index) {
    if (index != null) {
      widget.store.faqPergunta =
          widget.store.projetoModel?.faq?[index].pergunta;
      widget.store.faqResposta =
          widget.store.projetoModel?.faq?[index].resposta;
    } else {
      widget.store.faqPergunta = null;
      widget.store.faqResposta = null;
    }
    return Column(
      children: [
        InputWidget(
          label: 'Pergunta',
          onChanged: widget.store.setFaqPergunta,
          value: widget.store.faqPergunta,
          maxLines: 2,
          minLines: 2,
        ),
        const DividerWidget(height: 30),
        InputWidget(
          label: 'Resposta',
          onChanged: widget.store.setFaqResposta,
          value: widget.store.faqResposta,
          maxLines: 7,
          minLines: 7,
        ),
        const DividerWidget(height: 30),
        ButtonWidget.filled(
          width: 60.w,
          onPressed: () {
            widget.store.addFaq(
                widget.store.faqPergunta, widget.store.faqResposta, index);
            Modular.to.pop();
          },
          title: 'SALVAR',
          backgroundColor: focus,
        )
      ],
    );
  }
}
