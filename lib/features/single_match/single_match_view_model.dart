import 'dart:async';
import 'package:flutter/foundation.dart';

class SingleMatchViewModel with ChangeNotifier {
  int minutes = 0;
  int seconds = 0;

  String _teamAName = '';
  String _teamBName = '';
  int _teamAScore = 0;
  int _teamBScore = 0;

  String get teamAName => _teamAName;
  String get teamBName => _teamBName;

  int get teamAScore => _teamAScore;
  int get teamBScore => _teamBScore;

  set teamAName(String name) => _teamAName = name;
  set teamBName(String name) => _teamBName = name;

  bool get isPlaying => timer != null ? timer!.isActive : false;

  Timer? timer;

  void onStart() {
    notifyListeners();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds < 59) {
        seconds++;
      } else {
        seconds = 0;
        minutes++;
      }
      notifyListeners();
    });
  }

  void onPause() {
    notifyListeners();
    if (timer != null) {
      timer!.cancel();
    }
  }

  void onStop() {
    notifyListeners();
    if (timer != null) {
      timer!.cancel();
      minutes = 0;
      seconds = 0;
    }
  }

  void incrementTeamAScore() {
    _teamAScore++;
    notifyListeners();
  }

  void incrementTeamBScore() {
    _teamBScore++;
    notifyListeners();
  }

  void decrementTeamAScore() {
    if (_teamAScore > 0) _teamAScore--;
    notifyListeners();
  }

  void decrementTeamBScore() {
    if (_teamBScore > 0) _teamBScore--;
    notifyListeners();
  }
}
