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

class InputExtraWidget extends StatefulWidget {
  final ProjetoStore store;

  const InputExtraWidget({super.key, required this.store});

  @override
  State<InputExtraWidget> createState() => _InputExtraWidgetState();
}

class _InputExtraWidgetState extends State<InputExtraWidget> {
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
                      'Extras',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5),
                    ),
                    ButtonWidget.outlined(
                      onPressed: () {
                        showCustomBottomSheet(
                            context, 'ADICIONAR EXTRA', _addExtra(null));
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
                    itemCount: widget.store.projetoModel?.extras?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showCustomBottomSheet(
                                  context, 'ADICIONAR EXTRA', _addExtra(index));
                            },
                            child: ListTile(
                              title: (widget.store.projetoModel?.extras != null)
                                  ? Text(
                                      '${widget.store.projetoModel?.extras?[index].descricao}: ${widget.store.projetoModel?.extras?[index].valor}')
                                  : const Text(''),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  widget.store.deleteExtra(widget
                                      .store.projetoModel?.extras?[index]);
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

  _addExtra(index) {
    if (index != null) {
      widget.store.extraDescricao =
          widget.store.projetoModel?.extras?[index].descricao;
      widget.store.extraValor =
          widget.store.projetoModel?.extras?[index].valor.toString();
    } else {
      widget.store.extraDescricao = null;
      widget.store.extraValor = null;
    }
    return Column(
      children: [
        InputWidget(
          label: 'Descrição',
          onChanged: widget.store.setExtraDescricao,
          value: widget.store.extraDescricao,
        ),
        const DividerWidget(height: 30),
        InputWidget(
          label: 'Valor',
          onChanged: widget.store.setExtraValor,
          value: widget.store.extraValor,
        ),
        const DividerWidget(height: 30),
        ButtonWidget.filled(
          width: 60.w,
          onPressed: () {
            widget.store.addExtra(
                widget.store.extraDescricao, widget.store.extraValor, index);
            Modular.to.pop();
          },
          title: 'SALVAR',
          backgroundColor: focus,
        )
      ],
    );
  }
}
