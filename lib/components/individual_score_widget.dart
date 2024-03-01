import 'package:match_point_volley_log/core/core.dart';

class IndividualScoreWidget extends StatelessWidget {
  final String teamName;
  final int teamScore;
  const IndividualScoreWidget({super.key, required this.teamName, required this.teamScore});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ScoreTitleWidget(
            text: teamName,
            ballPossession: false,
            color: VLColors.green700,
            elevation: 10,
            textColor: VLColors.green50,
          ),
          const SizedBox(height: 20),
          Score(
            score: '$teamScore',
            ballPossession: true,
            color: VLColors.green50,
            textColor: VLColors.green700,
          )
        ],
      ),
    );
  }
}
