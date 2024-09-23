import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/curriculo/curriculo_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ModelosCriadosPage extends StatefulWidget {
  const ModelosCriadosPage({super.key});

  @override
  State<ModelosCriadosPage> createState() => _ModelosCriadosPageState();
}

class _ModelosCriadosPageState extends State<ModelosCriadosPage> {
  final CurriculoStore _store = Modular.get<CurriculoStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'Meus projetos',
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
    return const CircularProgressIndicator();
  }

  Widget _body() {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: 2,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget("Projeto X"),
                    GestureDetector(
                      onTap: () {},
                      child: textWidget("acessar página",
                          color: primary,
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: primary,
                              color: primary,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: textWidget('EXCLUIR', color: Colors.white),
                        icon: const Icon(Icons.delete_outline),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: primary,
                          iconColor: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
