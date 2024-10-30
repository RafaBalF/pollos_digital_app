import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/enums/button_sizes.enum.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputExperienciaWidget extends StatefulWidget {
  final ProjetoStore store;

  const InputExperienciaWidget({super.key, required this.store});

  @override
  State<InputExperienciaWidget> createState() => _InputExperienciaWidgetState();
}

class _InputExperienciaWidgetState extends State<InputExperienciaWidget> {
  final ValueNotifier<ObservableList?> _atividadesNotifier =
      ValueNotifier<ObservableList?>(null);

  final dateFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

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
                      'Experiência',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                    ButtonWidget.outlined(
                      onPressed: () {
                        showCustomBottomSheet(context, 'ADICIONAR EXPERIÊNCIA',
                            _addExperiencia(null));
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
                    itemCount: widget.store.projetoModel?.experiencias?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showCustomBottomSheet(
                                  context,
                                  'ADICIONAR EXPERIÊNCIA',
                                  _addExperiencia(index));
                            },
                            child: ListTile(
                              title: Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                    widget.store.projetoModel
                                            ?.experiencias?[index].cargo ??
                                        '',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  widget.store.deletExperiencia(widget.store
                                      .projetoModel?.experiencias?[index]);
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

  _addExperiencia(index) {
    if (index != null) {
      widget.store.experienciaCargo =
          widget.store.projetoModel?.experiencias?[index].cargo;
      widget.store.experienciaEmpresa =
          widget.store.projetoModel?.experiencias?[index].empresa;
      widget.store.experienciaDataDeInicio = DateFormat('dd/MM/yyyy')
          .format(widget.store.projetoModel?.experiencias?[index].dataDeInicio)
          .toString();
      widget.store.experienciaDataDeFim = DateFormat('dd/MM/yyyy')
          .format(widget.store.projetoModel?.experiencias?[index].dataDeFim)
          .toString();
      widget.store.experienciaDescricao =
          widget.store.projetoModel?.experiencias?[index].descricao;
    } else {
      widget.store.experienciaEmpresa = null;
      widget.store.experienciaCargo = null;
      widget.store.experienciaDataDeInicio = null;
      widget.store.experienciaDataDeFim = null;
      widget.store.experienciaDescricao = null;
    }
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          InputWidget(
            label: 'Cargo',
            onChanged: widget.store.setExperienciaCargo,
            value: widget.store.experienciaCargo,
          ),
          const DividerWidget(height: 15),
          InputWidget(
            label: 'Empresa',
            onChanged: widget.store.setExperienciaEmpresa,
            value: widget.store.experienciaEmpresa,
          ),
          const DividerWidget(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 44.w,
                child: InputWidget(
                  label: 'Data de Início',
                  onChanged: widget.store.setExperienciaDataDeInicio,
                  value: widget.store.experienciaDataDeInicio,
                  inputFormatters: [dateFormatter],
                ),
              ),
              SizedBox(
                width: 44.w,
                child: InputWidget(
                  label: 'Data de Fim',
                  onChanged: widget.store.setExperienciaDataDeFim,
                  value: widget.store.experienciaDataDeFim,
                  inputFormatters: [dateFormatter],
                ),
              ),
            ],
          ),
          const DividerWidget(height: 15),
          InputWidget(
            label: 'Descrição',
            onChanged: widget.store.setExperienciaDescricao,
            value: widget.store.experienciaDescricao,
          ),
          // InputAtividadesWidget(
          //     atividadesNotifier: _atividadesNotifier,
          //     store: widget.store,
          //     indexOfExperiencia: index),
          const DividerWidget(height: 30),
          ValueListenableBuilder<ObservableList?>(
              valueListenable: _atividadesNotifier,
              builder: (context, atividades, child) {
                return ButtonWidget.filled(
                  width: 60.w,
                  onPressed: () {
                    widget.store.addExperiencia(
                      widget.store.experienciaCargo,
                      widget.store.experienciaEmpresa,
                      widget.store.experienciaDataDeInicio,
                      widget.store.experienciaDataDeFim,
                      widget.store.experienciaDescricao, //atividades,
                      index,
                    );
                    Modular.to.pop();
                  },
                  title: 'SALVAR',
                  backgroundColor: focus,
                );
              })
        ],
      ),
    );
  }
}
