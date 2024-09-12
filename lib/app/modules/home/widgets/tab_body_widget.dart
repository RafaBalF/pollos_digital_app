import 'package:flutter/material.dart';
import 'package:pollos_digital/app/modules/home/widgets/tab_header_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TabBodyWidget extends StatefulWidget {
  final Widget widget;
  const TabBodyWidget({super.key, required this.widget});

  @override
  State<TabBodyWidget> createState() => _TabBodyWidgetState();
}

class _TabBodyWidgetState extends State<TabBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TabHeaderWidget(title: 'PERFIL'),
          DividerWidget(height: 1.h),
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: widget.widget,
          ),
        ],
      ),
    );
  }
}
