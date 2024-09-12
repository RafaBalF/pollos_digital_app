import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/constants.dart';
import 'package:pollos_digital/app/modules/launch/launch_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VersionUpdatePage extends StatefulWidget {
  const VersionUpdatePage({super.key});
  @override
  VersionUpdatePageState createState() => VersionUpdatePageState();
}

class VersionUpdatePageState extends State<VersionUpdatePage> {
  final LaunchStore _store = Modular.get<LaunchStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: background,
          height: 100.h,
          width: 100.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Observer(builder: (_) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textWidget(
                    'Seu aplicativo está desatualizado',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  DividerWidget(height: 2.h),
                  textWidget('Sua versão: ${_store.packageInfo.version}'),
                  textWidget('Versão mais recente ${_store.version}'),
                  DividerWidget(height: 2.h),
                  ButtonWidget.filled(
                      title: 'Atualizar',
                      backgroundColor: primary,
                      textColor: white,
                      onPressed: () async {
                        String targetURL = "";

                        targetURL = (Platform.isAndroid)
                            ? "market://details?id=$APP_NAME"
                            : "https://apps.apple.com/app/$APP_ID";

                        await launchUrlString(targetURL);
                      }),
                  _reloadBtn(),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _reloadBtn() {
    if (_store.obligatory) {
      return Container();
    }

    return Column(
      children: [
        DividerWidget(height: 3.h),
        GestureDetector(
          onTap: () {
            _store.ignoreUpdates();
            Modular.to.navigate('/');
          },
          child: textWidget(
            'Deixar para depois',
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
