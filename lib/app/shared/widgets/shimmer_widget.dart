import 'package:pollos_digital/app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: grey,
        highlightColor: lightGrey,
        child: Container(
          decoration: BoxDecoration(
              color: grey, borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
