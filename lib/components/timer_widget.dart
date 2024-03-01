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
    required this.onReset,
    required this.blink,
  });
  final String minutes;
  final String seconds;
  final bool isPlaying;
  final bool blink;
  final Function() onStart;
  final Function() onPause;
  final Function() onStop;
  final Function() onReset;

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
                  _DigitWidget(digit: minutes[0]),
                  _DigitWidget(digit: minutes[1]),
                  _BlinkWidget(blink: blink),
                  _DigitWidget(digit: seconds[0]),
                  _DigitWidget(digit: seconds[1]),
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
                onPress: isPlaying ? onStop : onReset,
                icon: isPlaying ? Icons.stop : Icons.refresh_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DigitWidget extends StatelessWidget {
  final String digit;
  const _DigitWidget({required this.digit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 30,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Opacity(
              opacity: 0.15,
              child: Text(
                '8',
                textAlign: TextAlign.right,
                style: VLTextStyle.timer(color: VLColors.green700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: digit == '1' ? 15 : 0),
              child: Text(
                digit,
                textAlign: TextAlign.right,
                style: VLTextStyle.timer(color: VLColors.green700),
              ),
            ),
          ],
        ));
  }
}

class _BlinkWidget extends StatelessWidget {
  final bool blink;
  const _BlinkWidget({required this.blink});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, right: 3),
      child: SizedBox(
        width: 10,
        child: Opacity(
          opacity: blink ? 1 : 0.15,
          child: Center(
            child: Text(
              ':',
              textAlign: TextAlign.right,
              style: VLTextStyle.timer(color: VLColors.green700),
            ),
          ),
        ),
      ),
    );
  }
}
