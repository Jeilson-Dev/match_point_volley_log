import 'package:match_point_volley_log/core/core.dart';

class ScoreTitleWidget extends StatelessWidget {
  const ScoreTitleWidget({super.key, required this.color, required this.text, required this.textColor, required this.ballPossession});
  final Color color;
  final Color textColor;
  final String text;

  final bool ballPossession;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Material(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        elevation: ballPossession ? 15 : 0,
        child: SizedBox(height: 40, child: Center(child: Text(text, style: VLTextStyle.scoreText(color: textColor)))),
      ),
    );
  }
}
