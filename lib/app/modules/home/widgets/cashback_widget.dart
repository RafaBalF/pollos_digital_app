import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pollos_digital/app/constants/telefone_contato.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CashbackWidget extends StatelessWidget {
  final double valor;
  const CashbackWidget({super.key, required this.valor});

  @override
  Widget build(BuildContext context) {
    if (valor == 0) return const SizedBox();

    const Color cashbackGreen = Color(0XFF3BCD98);
    const Color cashbackBg = Color(0XFF36897C);

    final NumberFormat formatter = NumberFormat("R\$ #,##0.00", "pt_BR");
    final valorCashback = formatter.format(valor);

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: Container(
            width: 90.w,
            height: 10.h,
            padding: EdgeInsets.symmetric(
              horizontal: 2.5.w,
              vertical: 1.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cashbackGreen,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget(
                  "Cashback $valorCashback",
                  style: h2(color: white),
                ),
                GestureDetector(
                  onTap: () async {
                    const text =
                        "Olá, vim do App Laserfast e gostaria de resgatar meu cashback";

                    const whatsappUrl =
                        "https://wa.me/$telefoneContato?text=$text";

                    await launchUrlString(whatsappUrl);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.5.w,
                      vertical: 0.5.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cashbackBg,
                    ),
                    child: textWidget(
                      "Clique para resgatar agora",
                      style: label(color: white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0.5.h,
          child: Image.asset('assets/images/home/cashback.png'),
        ),
      ],
    );
  }
}
