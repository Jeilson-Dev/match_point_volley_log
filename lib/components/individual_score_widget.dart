import 'package:match_point_volley_log/core/core.dart';
import 'package:match_point_volley_log/models/dto.dart';

class IndividualScoreWidget extends StatelessWidget {
  final TeamDto team;
  final TeamDto teamWithBallPossession;
  const IndividualScoreWidget({super.key, required this.team, required this.teamWithBallPossession});

  @override
  Widget build(BuildContext context) {
    final ballPossession = team == teamWithBallPossession;
    return Expanded(
      child: Column(
        children: [
          ScoreTitleWidget(
            text: team.name,
            color: team.isPlayerOne ? VLColors.green700 : VLColors.green50,
            ballPossession: ballPossession,
            textColor: team.isPlayerOne ? VLColors.green50 : VLColors.green700,
          ),
          const SizedBox(height: 20),
          Score(
            score: team.score,
            ballPossession: ballPossession,
            color: team.isPlayerOne ? VLColors.green700 : VLColors.green50,
            textColor: team.isPlayerOne ? VLColors.green50 : VLColors.green700,
          ),
          _BallPossessionWidget(
            ballPossession: team == teamWithBallPossession,
            color: team.isPlayerOne ? VLColors.green700 : VLColors.green50,
          ),
        ],
      ),
    );
  }
}

class _BallPossessionWidget extends StatelessWidget {
  final Color color;
  final bool ballPossession;
  const _BallPossessionWidget({required this.color, required this.ballPossession});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: ballPossession ? 1 : 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          elevation: 10,
          child: Container(
            height: 10,
            width: 80,
            decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.all(Radius.circular(4))),
          ),
        ),
      ),
    );
  }
}
