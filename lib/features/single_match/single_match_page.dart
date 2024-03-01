import 'package:match_point_volley_log/components/individual_score_widget.dart';
import 'package:match_point_volley_log/core/core.dart';
import 'package:match_point_volley_log/features/single_match/single_match_view_model.dart';

class SingleMatchPage extends StatefulWidget {
  const SingleMatchPage({super.key});

  static Widget create() => ChangeNotifierProvider(
        create: (context) => SingleMatchViewModel(),
        child: const SingleMatchPage(),
      );

  @override
  State<SingleMatchPage> createState() => _SingleMatchPageState();
}

class _SingleMatchPageState extends State<SingleMatchPage> {
  SingleMatchViewModel? model;

  @override
  void initState() {
    super.initState();
    model = context.read();
  }

  @override
  Widget build(BuildContext context) {
    model = context.watch();

    return Scaffold(
      backgroundColor: VLColors.green400,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
                TimerWidget(
                  isPlaying: model!.isPlaying,
                  blink: model!.seconds % 2 == 0,
                  onStart: model!.onStart,
                  onStop: model!.onStop,
                  onPause: model!.onPause,
                  minutes: model!.minutes.toString().padLeft(2, '0'),
                  seconds: model!.seconds.toString().padLeft(2, '0'),
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: Row(
                    children: [
                      IndividualScoreWidget(teamName: 'teamName', teamScore: model!.teamAScore),
                      IndividualScoreWidget(teamName: 'teamName', teamScore: model!.teamAScore),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                bottom: 140,
                right: 30,
                child: CircleButton(
                  backgroundColor: VLColors.green50,
                  iconColor: VLColors.green700,
                  onPress: model!.incrementTeamBScore,
                  onLongPress: model!.decrementTeamBScore,
                )),
            Positioned(
                bottom: 30,
                right: 140,
                child: CircleButton(
                  backgroundColor: VLColors.green700,
                  iconColor: VLColors.green50,
                  onPress: model!.incrementTeamAScore,
                  onLongPress: model!.decrementTeamAScore,
                )),
          ],
        ),
      ),
    );
  }
}
