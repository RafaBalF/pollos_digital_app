import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DividerWidget extends StatelessWidget {
  final String title;
  final double? height;
  final double? thickness;
  const DividerWidget(
      {super.key, this.title = "DividerWidget", this.height, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.transparent,
      height: height ?? 1.5.h,
      thickness: thickness ?? 1.h,
    );
  }
}
