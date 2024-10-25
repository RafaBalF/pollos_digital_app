import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputMissaoVisaoValoresWidget extends StatefulWidget {
  final ProjetoStore store;
  const InputMissaoVisaoValoresWidget({super.key, required this.store});

  @override
  State<InputMissaoVisaoValoresWidget> createState() =>
      _InputMissaoVisaoValoresWidgetState();
}

class _InputMissaoVisaoValoresWidgetState
    extends State<InputMissaoVisaoValoresWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          InputWidget(
            label: 'Missão',
            minLines: 4,
            maxLines: 4,
            onChanged: widget.store.setMissao,
            controller: TextEditingController(
                text: widget.store.projetoModel?.missao ?? ''),
          ),
          DividerWidget(height: 2.h),
          InputWidget(
            label: 'Visão',
            minLines: 4,
            maxLines: 4,
            onChanged: widget.store.setVisao,
            controller: TextEditingController(
                text: widget.store.projetoModel?.visao ?? ''),
          ),
          DividerWidget(height: 2.h),
          InputWidget(
            label: 'Valores',
            minLines: 4,
            maxLines: 4,
            onChanged: widget.store.setValores,
            controller: TextEditingController(
                text: widget.store.projetoModel?.valores ?? ''),
          ),
        ],
      );
    });
  }
}
