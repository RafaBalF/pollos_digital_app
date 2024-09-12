import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget textWidget(
  String? text, {
  double? fontSize,
  FontWeight? fontWeight = FontWeight.w500,
  Color? color = black,
  TextStyle? style,
  TextAlign? textAlign,
  int maxLines = 2,
  TextOverflow overflow = TextOverflow.ellipsis,
  bool autoSize = true,
  double minFontSize = 10,
}) {
  return (autoSize)
      ? AutoSizeText(
          text ?? "",
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
          minFontSize: minFontSize,
          style: style ??
              GoogleFonts.inter(
                fontSize: fontSize ?? 16.0.sp,
                fontWeight: fontWeight,
                color: color,
              ),
        )
      : Text(
          text ?? "",
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
          style: style ??
              GoogleFonts.inter(
                fontSize: fontSize ?? 16.0.sp,
                fontWeight: fontWeight,
                color: color,
              ),
        );
}
