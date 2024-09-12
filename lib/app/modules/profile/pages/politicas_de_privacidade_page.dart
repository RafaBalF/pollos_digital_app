import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/profile/profile_store.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PoliticasDePrivacidadePage extends StatefulWidget {
  const PoliticasDePrivacidadePage({super.key});
  @override
  PoliticasDePrivacidadePageState createState() =>
      PoliticasDePrivacidadePageState();
}

class PoliticasDePrivacidadePageState
    extends State<PoliticasDePrivacidadePage> {
  final ProfileStore _store = Modular.get<ProfileStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.initPoliticasDePrivacidade()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'POLÍTICAS DE PRIVACIDADE',
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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 1.h,
      ),
      child: Text(
        _store.politicaDePrivacidade,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void dispose() {
    _store.resetPoliticasDePrivacidade();

    super.dispose();
  }
}
