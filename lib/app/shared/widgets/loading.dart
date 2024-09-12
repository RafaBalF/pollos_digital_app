import 'package:flutter/material.dart';
import 'package:pollos_digital/app/shared/colors.dart';
// import 'package:lottie/lottie.dart' as lottie;

loadingCircular() {
  return Container(
    color: Colors.white,
    child: const Center(child: CircularProgressIndicator(color: primary)),
  );
}
