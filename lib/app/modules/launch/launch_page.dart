import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/launch/launch_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/enums/button_sizes.enum.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});
  @override
  LaunchPageState createState() => LaunchPageState();
}

class LaunchPageState extends State<LaunchPage> with TickerProviderStateMixin {
  final LaunchStore _store = Modular.get<LaunchStore>();
  late final AnimationController _animationController =
      AnimationController(vsync: this);

  late final Future<void> _future;

  Widget container = Container(color: primary);

  @override
  void initState() {
    _future = Future.wait([
      _store.checkShowPresentation(),
      _store.getAppVersion(),
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return _body();
        } else {
          return container;
        }
      },
    );
  }

  Widget _body() {
    if (_store.checkForUpdates && _store.shouldUpdate) {
      Modular.to.navigate('/version-update');

      return container;
    }

    if (!_store.usingAppForFirstTime) {
      Modular.to.navigate('/auth/');

      return container;
    }

    return mainBody();
  }

  Widget mainBody() {
    List<Widget> presentationPages = _presentation();

    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Observer(builder: (_) {
          return presentationPages[_store.presentationIndex];
        }),
      ),
    ));
  }

  List<Widget> _presentation() {
    return [
      _firstPage(),
    ];
  }

  Widget _firstPage() {
    return _presentationTemplate(
        'assets/images/app_presentation/first.png',
        'Descontos Exclusivos',
        'Inúmeros cupons e promoções para você se dar bem',
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: ButtonWidget.filledIcon(
            onPressed: () {
              Modular.to.navigate('/auth/login');
            },
            backgroundColor: primaryDark,
            iconData: Icons.arrow_forward_ios,
            iconSize: 20.sp,
            iconColor: white,
            buttonSize: ButtonSize.large,
          ),
        ));
  }

  Widget _presentationTemplate(
    String imgPath,
    String header,
    String subHeader,
    Widget widget,
  ) {
    return Container(
      decoration: const BoxDecoration(color: primary),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imgPath,
              height: 50.h,
            ),
            DividerWidget(height: 2.h),
            textWidget(
              header,
              textAlign: TextAlign.center,
              style: onboardingTitle(color: white),
              maxLines: 3,
            ),
            DividerWidget(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: textWidget(
                subHeader,
                textAlign: TextAlign.center,
                style: headTitle(color: white),
              ),
            ),
            widget,
            DividerWidget(height: 5.h),
          ]),
    );
  }

  @override
  void dispose() {
    try {
      _animationController.dispose();
    } catch (_) {}
    super.dispose();
  }
}
