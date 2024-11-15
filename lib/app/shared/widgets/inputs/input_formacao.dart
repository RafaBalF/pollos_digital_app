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
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pollos_digital/app/mixins/form_validations_mixin.dart';

class InputFormacaoWidget extends StatefulWidget {
  final ProjetoStore store;

  const InputFormacaoWidget({super.key, required this.store});

  @override
  State<InputFormacaoWidget> createState() => _InputFormacaoWidgetState();
}

class _InputFormacaoWidgetState extends State<InputFormacaoWidget>
    with FormValidationsMixin {
  final ValueNotifier<ObservableList?> _atividadesNotifier =
      ValueNotifier<ObservableList?>(null);

  final dateFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final List<String> statuses = [
    'Concluído',
    'Cursando',
    'Interrompido',
    'Em andamento',
  ];

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
                      'Formação',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                    ButtonWidget.outlined(
                      onPressed: () {
                        showCustomBottomSheet(
                            context, 'ADICIONAR FORMAÇÃO', _addFormacao(null));
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
                    itemCount: widget.store.projetoModel?.formacoes?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showCustomBottomSheet(context,
                                  'ADICIONAR FORMAÇÃO', _addFormacao(index));
                            },
                            child: ListTile(
                              title: Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  widget.store.projetoModel?.formacoes?[index]
                                          .curso ??
                                      '',
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  widget.store.deletFormacao(widget
                                      .store.projetoModel?.formacoes?[index]);
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

  _addFormacao(index) {
    if (index != null) {
      widget.store.formacaoCurso =
          widget.store.projetoModel?.formacoes?[index].curso;
      widget.store.formacaoInstituicao =
          widget.store.projetoModel?.formacoes?[index].instituicao;
      widget.store.formacaoDataDeInicio = DateFormat('dd/MM/yyyy')
          .format(widget.store.projetoModel?.formacoes?[index].dataDeInicio)
          .toString();
      widget.store.formacaoDataDeFim = DateFormat('dd/MM/yyyy')
          .format(widget.store.projetoModel?.formacoes?[index].dataDeFim)
          .toString();
      widget.store.formacaoDescricao =
          widget.store.projetoModel?.formacoes?[index].descricao;
      widget.store.formacaoStatus =
          widget.store.projetoModel?.formacoes?[index].status;
      if (widget.store.formacaoStatus == 'Concluido') {
        widget.store.formacaoStatus = 'Concluído';
      }
    } else {
      widget.store.formacaoInstituicao = null;
      widget.store.formacaoCurso = null;
      widget.store.formacaoDataDeInicio = null;
      widget.store.formacaoDataDeFim = null;
      widget.store.formacaoDescricao = null;
      widget.store.formacaoStatus = null;
    }
    widget.store.isDateFimValid = true;
    widget.store.isDateInicioValid = true;
    final formKey = GlobalKey<FormState>();
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              InputWidget(
                label: 'Curso',
                onChanged: widget.store.setFormacaoCurso,
                value: widget.store.formacaoCurso,
              ),
              const DividerWidget(height: 15),
              InputWidget(
                label: 'Instituição',
                onChanged: widget.store.setFormacaoInstituicao,
                value: widget.store.formacaoInstituicao,
              ),
              const DividerWidget(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 44.w,
                        child: InputWidget(
                          label: 'Data de Início',
                          onChanged: widget.store.setFormacaoDataDeInicio,
                          value: widget.store.formacaoDataDeInicio,
                          inputFormatters: [dateFormatter],
                          validator: (v) => combine([
                            () => notEmpty(v),
                            () => validDate(v),
                          ]),
                        ),
                      ),
                      DividerWidget(
                          height: widget.store.isDateFimValid ? 0 : 35)
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 44.w,
                        child: InputWidget(
                          label: 'Data de Fim',
                          onChanged: widget.store.setFormacaoDataDeFim,
                          value: widget.store.formacaoDataDeFim,
                          inputFormatters: [dateFormatter],
                          validator: (v) => combine([
                            () => notEmpty(v),
                            () => validDate(v),
                          ]),
                        ),
                      ),
                      DividerWidget(
                          height: widget.store.isDateInicioValid ? 0 : 35),
                    ],
                  ),
                ],
              ),
              const DividerWidget(height: 15),
              InputWidget(
                label: 'Descrição',
                onChanged: widget.store.setFormacaoDescricao,
                value: widget.store.formacaoDescricao,
              ),
              const DividerWidget(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                    'Situação', // Rótulo do dropdown
                    style: label(color: black),
                  ),
                  SizedBox(height: 1.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1), // Borda
                      borderRadius:
                          BorderRadius.circular(5), // Bordas arredondadas
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // Espaçamento interno
                    child: DropdownButton<String>(
                      value: widget.store.formacaoStatus,
                      hint: const Text('Selecione um status'),
                      isExpanded:
                          true, // Para que o dropdown ocupe toda a largura
                      items: statuses.map((String status) {
                        return DropdownMenuItem<String>(
                          value: status,
                          child: Text(status),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        widget.store.setFormacaoStatus(newValue);
                      },
                      underline:
                          const SizedBox(), // Remove a linha padrão do dropdown
                    ),
                  ),
                ],
              ),
              const DividerWidget(height: 30),
              ValueListenableBuilder<ObservableList?>(
                  valueListenable: _atividadesNotifier,
                  builder: (context, atividades, child) {
                    return ButtonWidget.filled(
                      width: 60.w,
                      onPressed: () {
                        widget.store.setDateInicioFimValid(
                            widget.store.formacaoDataDeInicio,
                            widget.store.formacaoDataDeFim);
                        if (!formKey.currentState!.validate()) return;

                        widget.store.addFormacao(
                          widget.store.formacaoCurso,
                          widget.store.formacaoInstituicao,
                          widget.store.formacaoDataDeInicio,
                          widget.store.formacaoDataDeFim,
                          widget.store.formacaoDescricao,
                          widget.store.formacaoStatus,
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
        ),
      );
    });
  }
}
