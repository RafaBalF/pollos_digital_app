import 'package:flutter_svg/svg.dart';
import 'package:pollos_digital/app/modules/diario/classes/map_position.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MapItem extends StatelessWidget {
  final Function()? onPressed;
  final MapPosition position;
  final bool desbloqueado;
  final bool usado;
  final String imagePath;
  final double? imageHeight;
  final double? imageWidth;

  const MapItem({
    super.key,
    required this.onPressed,
    required this.position,
    required this.desbloqueado,
    required this.usado,
    required this.imagePath,
    this.imageHeight,
    this.imageWidth,
  });

  factory MapItem.estrela({
    required Function()? onPressed,
    required MapPosition? position,
    required bool desbloqueado,
    required bool usado,
  }) {
    final String path = desbloqueado
        ? 'assets/images/diario/estrela.svg'
        : 'assets/images/diario/estrela-apagada.svg';

    return MapItem(
      onPressed: (usado) ? () {} : onPressed,
      position: position ?? MapPosition(),
      desbloqueado: desbloqueado,
      usado: usado,
      imagePath: path,
    );
  }

  factory MapItem.tesouro({
    required Function()? onPressed,
    required MapPosition? position,
    required bool desbloqueado,
    required bool usado,
  }) {
    final String path = desbloqueado
        ? 'assets/images/diario/tesouro-aberto.svg'
        : 'assets/images/diario/tesouro-fechado.svg';

    return MapItem(
      onPressed: (usado) ? () {} : onPressed,
      position: position ?? MapPosition(),
      desbloqueado: desbloqueado,
      usado: usado,
      imagePath: path,
    );
  }

  factory MapItem.aviso({
    required Function()? onPressed,
    required MapPosition? position,
    required String imgPath,
    double? imageHeight,
    double? imageWidth,
  }) {
    return MapItem(
      onPressed: onPressed,
      position: position ?? MapPosition(),
      desbloqueado: true,
      usado: false,
      imagePath: imgPath,
      imageHeight: imageHeight ?? 5.h,
      imageWidth: imageWidth ?? 10.w,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.left,
      top: position.top,
      right: position.right,
      bottom: position.bottom,
      width: position.width,
      height: position.height,
      child: GestureDetector(
        onTap: onPressed,
        child: SvgPicture.asset(
          imagePath,
          height: imageHeight,
          width: imageWidth,
        ),
      ),
    );
  }
}
