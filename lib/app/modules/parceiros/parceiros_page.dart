import 'package:flutter/material.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ParceirosPage extends StatefulWidget {
  const ParceirosPage({super.key});
  @override
  ParceirosPageState createState() => ParceirosPageState();
}

class ParceirosPageState extends State<ParceirosPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleScaffoldWidget(
      title: 'PARCEIROS',
      bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.80,
          children: _getTiles().map((t) => t).toList(),
        ),
      ),
    );
  }

  List<Widget> _getTiles() {
    return [
      _tileCard(
        'assets/images/profile/duckbill.png',
        "A Duckbill é a Casa do Melhor Cookie do Brasil e Cafés Especiais.",
        () => launchUrlString(""),
      ),
      _tileCard(
        'assets/images/profile/duckbill.png',
        "A Duckbill é a Casa do Melhor Cookie do Brasil e Cafés Especiais.",
        () => launchUrlString(""),
      ),
      _tileCard(
        'assets/images/profile/duckbill.png',
        "A Duckbill é a Casa do Melhor Cookie do Brasil e Cafés Especiais.",
        () => launchUrlString(""),
      ),
      _tileCard(
        'assets/images/profile/duckbill.png',
        "A Duckbill é a Casa do Melhor Cookie do Brasil e Cafés Especiais.",
        () => launchUrlString(""),
      ),
    ];
  }

  Widget _tileCard(
    String imgPath,
    String title,
    Function()? onTap, {
    int maxLines = 4,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: grey,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100.w,
              child: Image.asset(imgPath, fit: BoxFit.cover),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5.w),
              child: textWidget(
                title,
                style: profileTile(),
                maxLines: maxLines,
              ),
            ),
            // SizedBox(height: 1.h),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: SizedBox(
                      height: 3.h,
                      width: 100.w,
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(primary),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        child: textWidget(
                          'ACESSAR',
                          style: headTitle(color: white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
