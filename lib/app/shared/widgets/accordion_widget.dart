import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccordionWidget extends StatelessWidget {
  final String label;
  final Widget content;
  final TextStyle? titleStyle;
  final bool initiallyExpanded;

  const AccordionWidget({
    super.key,
    required this.label,
    required this.content,
    this.titleStyle,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      shape: const Border(),
      collapsedIconColor: primary,
      title: textWidget(
        label,
        style: titleStyle ?? GoogleFonts.inter(fontSize: 16.sp),
      ),
      children: <Widget>[content],
    );
  }
}
