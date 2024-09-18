import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pollos_digital/app/modules/home/widgets/bottom_navigation_bar.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScaffoldWidget extends StatefulWidget {
  final Widget body;

  const MainScaffoldWidget({super.key, required this.body});

  @override
  State<MainScaffoldWidget> createState() => _MainScaffoldWidgetState();
}

class _MainScaffoldWidgetState extends State<MainScaffoldWidget> {
  // final HomeStore _store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Image.asset('assets/icons/icon-pollos-digital.png'),
        ),
        centerTitle: true,
        backgroundColor: white,
        title: Center(child: _main()),
        elevation: 0,
        actions: [
          _padding(
            GestureDetector(
              child: SvgPicture.asset('assets/icons/svg/user_accent.svg'),
              onTap: () => Modular.to.pushNamed('/profile/'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          alignment: Alignment.topLeft,
          color: background,
          padding: EdgeInsets.only(left: 5.w),
          child: Flex(
            direction: Axis.vertical,
            children: [widget.body, DividerWidget(height: 5.h)],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget _main() {
    // return Observer(builder: (_) {
    //   return GestureDetector(
    //     onTap: () {},
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         textWidget(
    //           'Aviso',
    //           style: label(color: darkGrey),
    //         ),
    //         textWidget(
    //           'Você tem pendência',
    //           style: headTitle(color: primary),
    //         ),
    //       ],
    //     ),
    //   );
    // });

    // return Image.asset(
    //   'assets/icons/laserfast-logo-primary-shortened.png',
    //   height: 3.h,
    // );

    return Text('PollosDigital');
  }

  Widget _padding(Widget child) {
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: child,
    );
  }
}
