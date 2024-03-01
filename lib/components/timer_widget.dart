import 'package:match_point_volley_log/core/core.dart';

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
                  SizedBox(width: 65, child: Text(minutes, style: VLTextStyle.timer(color: VLColors.green700))),
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
                  SizedBox(width: 70, child: Text(seconds, style: VLTextStyle.timer(color: VLColors.green700))),
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
