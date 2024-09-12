import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          title: 'App',
          theme: ThemeData(
            primarySwatch: primaryMaterial,
            focusColor: primary,
            primaryColor: primary,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: primary,
              selectionHandleColor: primary,
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              modalBackgroundColor: white,
              backgroundColor: white,
            ),
            cupertinoOverrideTheme:
                const CupertinoThemeData(primaryColor: primary),
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          ),
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
