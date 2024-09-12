import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/pagamento/pagamentos_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PixPage extends StatefulWidget {
  const PixPage({super.key});
  @override
  PixPageState createState() => PixPageState();
}

class PixPageState extends State<PixPage> {
  final PagamentosStore _store = Modular.get<PagamentosStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.initPix()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
          title: 'PIX',
          bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
          body: Observer(
            builder: (_) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return _body();
              } else {
                return _loadingBody();
              }
            },
          ),
        );
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
    return Column(
      children: [
        DividerWidget(height: 2.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              textWidget(
                'Copie a chave PIX ou pague pelo QR Code',
                style: h2(color: black),
                textAlign: TextAlign.center,
              ),
              DividerWidget(height: 2.h),
              _timer(),
              DividerWidget(height: 5.h),
              _qrCode(),
              DividerWidget(height: 2.h),
              _pixCode(),
            ],
          ),
        ),
        DividerWidget(height: 2.h),
        _copyCodeBtn()
      ],
    );
  }

  Widget _timer() {
    return Observer(builder: (_) {
      Duration clockTimer = Duration(seconds: _store.pixDuration);

      String minutes = clockTimer.inMinutes.remainder(60).toString();
      String seconds =
          clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0');

      return textWidget(
        "Expira em: $minutes:$seconds",
        style: h2(color: black),
        textAlign: TextAlign.center,
      );
    });
  }

  Widget _qrCode() {
    return Image.asset('assets/images/pagamentos/qrcode_example.png');
  }

  Widget _pixCode() {
    return GestureDetector(
      onTap: _copyCode,
      child: textWidget(
        _store.pixCode,
        style: h2(color: black),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _copyCodeBtn() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: ButtonWidget.outlined(
        onPressed: _copyCode,
        borderColor: darkGrey,
        title: 'PIX COPIA E COLA',
        textColor: darkGrey,
      ),
    );
  }

  void _copyCode() async {
    Clipboard.setData(ClipboardData(text: _store.pixCode)).then((_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).clearSnackBars();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: textWidget("CÓDIGO COPIADO COM SUCESSO", color: white),
        backgroundColor: primary,
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
      ));
    });
  }

  @override
  void dispose() {
    _store.resetPix();

    super.dispose();
  }
}
