import 'package:pollos_digital/app/modules/diario/classes/map_position.dart';

class MapItemValues {
  MapPosition position;
  dynamic Function()? onPressed;

  MapItemValues({
    required this.position,
    required this.onPressed,
  });
}
