import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SimpleScaffoldWidget extends StatelessWidget {
  final String title;
  final Widget body;
  final bool reverse;
  final Widget? progress;
  final Widget? floatingActionButton;
  final List<Widget>? actions;
  final bool? drawer;
  final bool loading;
  final Widget? bottomNavigationBar;
  final Color? headerColor;
  final Color? bodyColor;
  final EdgeInsetsGeometry? bodyPadding;
  final bool showReturnArrow;
  final Color? returnArrowColor;
  final ScrollController? controller;
  final Function()? onBack;

  const SimpleScaffoldWidget({
    super.key,
    this.title = "",
    required this.body,
    this.progress,
    this.floatingActionButton,
    this.actions,
    this.drawer = true,
    this.loading = false,
    this.bottomNavigationBar,
    this.headerColor,
    this.bodyColor,
    this.bodyPadding,
    this.showReturnArrow = true,
    this.reverse = false,
    this.returnArrowColor,
    this.controller,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final Color finalBodyColor = bodyColor ?? background;
    final Color finalHeaderColor = headerColor ?? finalBodyColor;
    final Color finalReturnArrowColor = returnArrowColor ?? primary;

    return Scaffold(
      backgroundColor: finalHeaderColor,
      appBar: AppBar(
        leading: showReturnArrow
            ? Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: finalReturnArrowColor,
                  ),
                  onPressed: (onBack != null)
                      ? onBack
                      : () {
                          if (Modular.to.canPop()) {
                            Modular.to.pop();
                          }
                        },
                ),
              )
            : const SizedBox(),
        centerTitle: true,
        backgroundColor: finalBodyColor,
        title: Text(
          title,
          style: headTitle(color: black),
        ),
        elevation: 0,
        // toolbarHeight: 6.1.h,
        actions: actions,
      ),
      body: SingleChildScrollView(
        reverse: reverse,
        controller: controller,
        child: Container(
          width: 100.w,
          color: finalBodyColor,
          padding:
              (bodyPadding != null) ? bodyPadding : EdgeInsets.only(left: 5.w),
          child: Flex(
            direction: Axis.vertical,
            children: [body],
          ),
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
