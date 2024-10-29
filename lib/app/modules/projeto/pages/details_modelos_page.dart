import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetaislModelosPage extends StatefulWidget {
  const DetaislModelosPage({super.key});

  @override
  State<DetaislModelosPage> createState() => _DetaislModelosPageState();
}

class _DetaislModelosPageState extends State<DetaislModelosPage> {
  final ProjetoStore _store = Modular.get<ProjetoStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.initProjetosModelo()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'Modelos',
            bodyPadding: EdgeInsets.all(2.w),
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
    return const CircularProgressIndicator(
      color: primary,
    );
  }

  Widget _body() {
    return Column(
      children: [
        SizedBox(
            width: 100.w,
            child: textWidget('Titulo',
                fontSize: 20.sp, textAlign: TextAlign.start)),
        DividerWidget(height: 2.h),
        _verticalBanners(),
        DividerWidget(height: 2.h),
        textWidget(
          'descricao Modelo is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
          autoSize: false,
          maxLines: 10,
          fontSize: 17.sp,
        ),
        DividerWidget(height: 8.h),
        textWidget(
          'Planos',
          fontSize: 30.sp,
          color: focus,
          fontWeight: FontWeight.bold,
        ),
        textWidget('Escolha seu plano',
            fontSize: 18.sp, fontWeight: FontWeight.bold),
        DividerWidget(height: 2.h),
        _verticalBanners(),
        DividerWidget(height: 2.h),
      ],
    );
  }

  Widget _verticalBanners() {
    return Column(
      children: [
        DividerWidget(height: 1.h),
        SizedBox(
          height: 35.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return _verticalBanner(
                '',
                '',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _verticalBanner(String imgUrl, String route) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          // launchUrlString(route);
        },
        child: Padding(
          padding: const EdgeInsets.all(3),
          // child: Image.network(imgUrl),
          child: Image.asset('assets/images/projeto/4.png'),
        ),
      ),
    );
  }
}
