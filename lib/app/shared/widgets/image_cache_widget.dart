import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ImageCacheWidget extends StatelessWidget {
  final String img;
  const ImageCacheWidget({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: img,
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, downloadProgress) => Container(
              width: 40.w,
              height: 30.w,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
        errorWidget: (context, url, error) => CachedNetworkImage(
              imageUrl: img,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Container(
                width: 40.w,
                height: 30.w,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) =>
                  const FaIcon(FontAwesomeIcons.image),
            ));
  }
}
