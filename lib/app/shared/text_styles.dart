import 'package:flutter/material.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

TextStyle defaultStyle({
  double? fontSize,
  FontWeight? fontWeight = FontWeight.w500,
  Color? color = black,
  TextAlign? textAlign,
  int maxLines = 2,
  overflow = TextOverflow.ellipsis,
  double? height,
  TextDecoration? textDecoration,
}) {
  return TextStyle(
    fontSize: fontSize ?? 16.0.sp,
    fontWeight: fontWeight,
    color: color,
    height: height ?? 1.1,
    decoration: textDecoration,
    decorationColor: color,
  );
}

TextStyle homeHeader({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: color,
    height: 1.1,
    textDecoration: textDecoration,
  );
}

TextStyle onboardingTitle({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: color,
    height: 1.1,
    textDecoration: textDecoration,
  );
}

TextStyle categoryTitle({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: color,
    height: 1.2,
    textDecoration: textDecoration,
  );
}

TextStyle large({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: color,
    height: 1.3,
    textDecoration: textDecoration,
  );
}

TextStyle h2({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: color,
    height: 1.3,
    textDecoration: textDecoration,
  );
}

TextStyle headTitle({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    color: color,
    height: 1.5,
    textDecoration: textDecoration,
  );
}

TextStyle label({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: color,
    height: 1.5,
    textDecoration: textDecoration,
  );
}

TextStyle medium({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: color,
    height: 1.5,
    textDecoration: textDecoration,
  );
}

TextStyle text({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: color,
    height: 1.5,
    textDecoration: textDecoration,
  );
}

TextStyle profileTile({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: color,
    height: 1.1,
    textDecoration: textDecoration,
  );
}

TextStyle homeBottomBarItem({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: color,
    height: 2.5,
    textDecoration: textDecoration,
  );
}

TextStyle modalHeader({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w900,
    color: color,
    textDecoration: textDecoration,
  );
}

TextStyle modalDetails({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w900,
    color: color,
    textDecoration: textDecoration,
  );
}

TextStyle small({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: color,
    textDecoration: textDecoration,
  );
}

TextStyle verySmall({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: color,
    height: 1,
    textDecoration: textDecoration,
  );
}

TextStyle mostWished({Color? color, TextDecoration? textDecoration}) {
  return defaultStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: color,
    textDecoration: textDecoration,
  );
}
