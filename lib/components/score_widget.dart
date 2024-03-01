import 'package:match_point_volley_log/core/core.dart';

class Score extends StatelessWidget {
  const Score({super.key, required this.score, required this.color, required this.textColor, required this.ballPossession});
  final String score;
  final Color color;

  final Color textColor;
  final bool ballPossession;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      elevation: !ballPossession ? 15 : 2,
      child: SizedBox(
        height: 120,
        width: 100,
        child: Center(
            child: Text(
          score,
          style: VLTextStyle.score(color: textColor),
        )),
      ),
    );
  }
}
