import 'package:match_point_volley_log/core/core.dart';

class VLAlertDialog {
  final String title;
  final String message;
  final List<Widget> actions;

  VLAlertDialog({required this.title, required this.message, required this.actions});

  Future<void> show(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: VLColors.green50,
          title: Text(
            title,
            style: VLTextStyle.dialogTitle(),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  message,
                  style: VLTextStyle.dialogMessage(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: actions,
        );
      },
    );
  }
}
