import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volley_log/features/score/score_view_model.dart';
import 'package:volley_log/theme/vl_colors.dart';
import 'package:volley_log/theme/vl_text_styles.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  static Widget create() => ChangeNotifierProvider(
        create: (context) => ScoreViewModel(),
        child: const ScorePage(),
      );

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  ScoreViewModel? model;

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
                Row(children: [
                  ScoreTitleWidget(
                    text: model!.teamAName,
                    ballPossession: false,
                    color: VLColors.green700,
                    elevation: 10,
                    textColor: VLColors.green50,
                  ),
                  const SizedBox(width: 10),
                  ScoreTitleWidget(
                    text: model!.teamBName,
                    ballPossession: true,
                    color: VLColors.green50,
                    elevation: 10,
                    textColor: VLColors.green700,
                  ),
                ]),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Score(
                      score: '${model!.teamAScore}',
                      ballPossession: false,
                      color: VLColors.green700,
                      textColor: VLColors.green50,
                    ),
                    Score(
                      score: '${model!.teamBScore}',
                      ballPossession: true,
                      color: VLColors.green50,
                      textColor: VLColors.green700,
                    ),
                  ],
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

class ScoreTitleWidget extends StatelessWidget {
  const ScoreTitleWidget({super.key, required this.color, required this.text, this.elevation = 2, required this.textColor, required this.ballPossession});
  final Color color;
  final Color textColor;
  final String text;
  final double elevation;
  final bool ballPossession;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        elevation: !ballPossession ? 15 : 2,
        child: SizedBox(
          height: 40,
          child: Center(
            child: Text(
              text,
              style: VLTextStyle.scoreText(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}

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
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return VLColors.green200;
          }
          return null;
        }),
        borderRadius: BorderRadius.circular(100),
        onTap: onPress,
        onLongPress: onLongPress,
        child: SizedBox(
          height: 60,
          width: 60,
          child: Icon(icon, color: iconColor),
        ),
      ),
    );
  }
}

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
    required this.minutes,
    required this.seconds,
    required this.isPlaying,
    required this.onStart,
    required this.onPause,
    required this.onStop,
    required this.blink,
  });
  final String minutes;
  final String seconds;
  final bool isPlaying;
  final bool blink;
  final Function() onStart;
  final Function() onPause;
  final Function() onStop;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: VLColors.green200,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: SizedBox(
        height: 140,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 65,
                    child: Text(
                      minutes,
                      style: VLTextStyle.timer(color: VLColors.green700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: SizedBox(
                      width: 15,
                      child: Center(
                        child: Text(
                          blink ? ': ' : ' ',
                          style: VLTextStyle.timer(color: VLColors.green700),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: Text(
                      seconds,
                      style: VLTextStyle.timer(color: VLColors.green700),
                    ),
                  ),
                ],
              ),
              CircleButton(
                backgroundColor: VLColors.green400,
                iconColor: VLColors.green700,
                icon: isPlaying ? Icons.pause : Icons.play_arrow,
                onPress: isPlaying ? onPause : onStart,
              ),
              CircleButton(
                backgroundColor: VLColors.green400,
                iconColor: VLColors.green700,
                onPress: onStop,
                icon: Icons.stop,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
