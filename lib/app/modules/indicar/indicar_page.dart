import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:pollos_digital/app/mixins/form_validations_mixin.dart';
import 'package:pollos_digital/app/models/indicado.model.dart';
import 'package:pollos_digital/app/modules/indicar/indicar_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IndicarPage extends StatefulWidget {
  const IndicarPage({super.key});
  @override
  IndicarPageState createState() => IndicarPageState();
}

class IndicarPageState extends State<IndicarPage> with FormValidationsMixin {
  final IndicarStore _store = Modular.get<IndicarStore>();
  late final Future<void> _future;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final DateFormat indicadoEmFormatter = DateFormat("dd/MM/yyyy 'as' HH:mm");

  @override
  void initState() {
    _future = Future.wait([_store.init()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'INDICAR',
            showReturnArrow: false,
            actions: [
              GestureDetector(
                onTap: () => Modular.to.pop(),
                child: Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Icon(
                    Icons.close,
                    color: primary,
                    size: 22.sp,
                  ),
                ),
              ),
            ],
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Observer(builder: (_) {
                    return _body();
                  });
                } else {
                  return _loadingBody();
                }
              },
            ));
      },
    );
  }

  Widget _loadingBody() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          6,
          (index) => Column(
            children: [
              ShimmerWidget(width: 90.w, height: 6.h),
              DividerWidget(height: 1.h),
              ShimmerWidget(width: 90.w, height: 2.h),
              DividerWidget(height: 1.h),
              ShimmerWidget(width: 90.w, height: 2.h),
              DividerWidget(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Flex(
      direction: Axis.vertical,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              InputWidget(
                label: 'Nome',
                validator: notEmpty,
                controller: nameController,
              ),
              DividerWidget(height: 2.h),
              InputWidget(
                label: 'Celular',
                inputFormatters: [phoneFormatter],
                validator: (v) => combine([
                  () => notEmpty(v),
                  () => atLeastNChars(15, v, 'Número de celular inválido'),
                ]),
                controller: phoneController,
              ),
              DividerWidget(height: 5.h),
              ButtonWidget.filled(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;

                  final r = await _store.indicar(
                    nameController.text,
                    phoneController.text,
                  );

                  nameController.value = TextEditingValue.empty;
                  phoneController.value = TextEditingValue.empty;

                  if (!mounted) return;

                  showBaseModalBottomSheet(
                    context,
                    r,
                    dismissable: false,
                    onClose: () {
                      Modular.to.pop();
                    },
                    onErrorPressed: () {
                      Modular.to.pop();
                    },
                    onSuccessPressed: () {
                      Modular.to.pop();
                      Modular.to.pop();
                    },
                  );
                },
                backgroundColor: primary,
                title: 'SALVAR',
                textColor: white,
              ),
            ],
          ),
        ),
        DividerWidget(height: 5.h),
        Observer(builder: (_) {
          return Column(
            children: _store.indicados.map((i) => _indicadoCard(i)).toList(),
          );
        }),
      ],
    );
  }

  Widget _indicadoCard(IndicadoModel indicado) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.5.h),
      child: Container(
        decoration: const BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(color: grey),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget(indicado.name, style: headTitle(color: darkerGrey)),
                (indicado.indicadoEm != null)
                    ? textWidget(
                        indicadoEmFormatter.format(indicado.indicadoEm!),
                        style: small(color: darkerGrey),
                      )
                    : const SizedBox(),
              ],
            ),
            DividerWidget(height: 0.5.h),
            textWidget(indicado.email, style: small(color: darkerGrey)),
            DividerWidget(height: 0.5.h),
            textWidget(indicado.phone, style: small(color: darkerGrey)),
            DividerWidget(height: 2.h),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _store.reset();

    super.dispose();
  }
}
