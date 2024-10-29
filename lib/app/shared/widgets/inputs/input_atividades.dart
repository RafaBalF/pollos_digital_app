import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/enums/button_sizes.enum.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class InputAtividadesWidget extends StatefulWidget {
  final ProjetoStore store;
  final ValueNotifier<ObservableList?>? atividadesNotifier;
  final int? indexOfExperiencia;
  const InputAtividadesWidget(
      {super.key,
      required this.store,
      this.atividadesNotifier,
      this.indexOfExperiencia});

  @override
  State<InputAtividadesWidget> createState() => _InputAtividadesWidgetState();
}

class _InputAtividadesWidgetState extends State<InputAtividadesWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ValueListenableBuilder<ObservableList?>(
          valueListenable: widget.atividadesNotifier!,
          builder: (context, valor, child) {
            return Container(
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0)),
                      color: Colors.grey[400],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Atividades',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                height: 1.5),
                          ),
                          ButtonWidget.outlined(
                            onPressed: () {
                              showCustomBottomSheet(context,
                                  'ADICIONAR ATIVIDADE', _addAtividade(null));
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
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.store.atividades.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showCustomBottomSheet(
                                        context,
                                        'ADICIONAR ATIVIDADE',
                                        _addAtividade(index));
                                  },
                                  child: ListTile(
                                    title: Text(widget.store.atividades[index]),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        widget.store.deleteAtividade(
                                            widget.store.atividades[index]);
                                        setState(() {});
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
          },
        );
      },
    );
  }

  _addAtividade(index) {
    if (index != null) {
      widget.store.habilidade = widget.store.projetoModel?.habilidades?[index];
    } else {
      widget.store.habilidade = null;
    }
    return Column(
      children: [
        InputWidget(
          label: 'Atividade',
          onChanged: widget.store.setAtividade,
          value: widget.store.atividade,
        ),
        const DividerWidget(height: 30),
        ButtonWidget.filled(
          width: 60.w,
          onPressed: () {
            widget.store.addAtividade(widget.store.atividade, index);
            widget.atividadesNotifier?.value = widget.store.atividades;
            setState(() {});
            Modular.to.pop();
          },
          title: 'SALVAR',
          backgroundColor: focus,
        )
      ],
    );
  }
}
