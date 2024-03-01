import 'package:match_point_volley_log/core/core.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.backgroundColor,
    required this.iconColor,
    this.icon = Icons.add,
    this.onPress,
    this.onLongPress,
  });
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Function()? onPress;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: const CircleBorder(),
      elevation: 10,
      child: InkWell(
        onTap: onPress,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(100),
        overlayColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.pressed) ? VLColors.green200 : null),
        child: SizedBox(height: 60, width: 60, child: Icon(icon, color: iconColor)),
      ),
    );
  }
}
