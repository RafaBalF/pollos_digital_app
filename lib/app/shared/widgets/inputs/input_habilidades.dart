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

class InputHabilidadesWidget extends StatefulWidget {
  final ProjetoStore store;
  const InputHabilidadesWidget({super.key, required this.store});

  @override
  State<InputHabilidadesWidget> createState() => _InputHabilidadesWidgetState();
}

class _InputHabilidadesWidgetState extends State<InputHabilidadesWidget> {
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
                      'Habilidades',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5),
                    ),
                    ButtonWidget.outlined(
                      onPressed: () {
                        showCustomBottomSheet(context, 'ADICIONAR HABILIDADE',
                            _addHabilidade(null));
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
                    itemCount: widget.store.projetoModel?.habilidades?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showCustomBottomSheet(
                                  context,
                                  'ADICIONAR HABILIDADE',
                                  _addHabilidade(index));
                            },
                            child: ListTile(
                              title: (widget.store.projetoModel?.habilidades !=
                                      null)
                                  ? Text(widget
                                      .store.projetoModel?.habilidades?[index])
                                  : const Text(''),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  widget.store.deleteHabilidade(widget
                                      .store.projetoModel?.habilidades?[index]);
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

  _addHabilidade(index) {
    if (index != null) {
      widget.store.habilidade = widget.store.projetoModel?.habilidades?[index];
    } else {
      widget.store.habilidade = null;
    }
    return Column(
      children: [
        InputWidget(
          label: 'Habilidade',
          onChanged: widget.store.setHabilidade,
          value: widget.store.habilidade,
        ),
        const DividerWidget(height: 30),
        ButtonWidget.filled(
          width: 60.w,
          onPressed: () {
            widget.store.addHabilidade(widget.store.habilidade, index);
            Modular.to.pop();
          },
          title: 'SALVAR',
          backgroundColor: focus,
        )
      ],
    );
  }
}
