import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AntesPrimeiraSessaoPage extends StatefulWidget {
  const AntesPrimeiraSessaoPage({super.key});
  @override
  AntesPrimeiraSessaoPageState createState() => AntesPrimeiraSessaoPageState();
}

class AntesPrimeiraSessaoPageState extends State<AntesPrimeiraSessaoPage> {
  @override
  Widget build(BuildContext context) {
    return SimpleScaffoldWidget(
      title: "Antes da 1° sessão",
      bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            'Seja bem-vindo à sua primeira sessão! Antes de iniciar é fundamental que você esteja usando os óculos de proteção.',
            style: text(),
            maxLines: 15,
          ),
          DividerWidget(height: 3.h),
          textWidget(
            'O que você pode sentir durante o tratamento?',
            style: h2(),
            maxLines: 5,
          ),
          DividerWidget(height: 3.h),
          textWidget(
            'Seja bem-vindo à sua primeira sessão! Antes de iniciar é fundamental que você esteja usando os óculos de proteção.',
            style: text(),
            maxLines: 15,
          ),
          DividerWidget(height: 3.h),
          textWidget(
            'Após a sessão',
            style: h2(),
            maxLines: 5,
          ),
          DividerWidget(height: 3.h),
          textWidget(
            'Após a sessão é natural notar uma vermelhidão e leve sensação de ardência, mas fique tranquilo, porque em instantes tudo voltará ao normal. Caso tenha qualquer reação adversa, entre em contato imediatamente com a unidade. Falhas podem aparecer por toda parte, sem saber ao certo em qual local e quantidade, já que cada organismo responde de uma forma.',
            style: text(),
            maxLines: 15,
          ),
          DividerWidget(height: 5.h),
          ButtonWidget.filled(
            onPressed: () => Modular.to.pushNamed("/diario/primeira-sessao"),
            title: "PRÓXIMO",
          )
        ],
      ),
    );
  }
}
