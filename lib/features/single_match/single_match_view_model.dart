import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:match_point_volley_log/models/dto.dart';

class SingleMatchViewModel with ChangeNotifier {
  int minutes = 0;
  int seconds = 0;

  TeamDto teamA = TeamDto.fixture().copyWith(name: 'Time A', isPlayerOne: true);
  TeamDto teamB = TeamDto.fixture().copyWith(name: 'Time B');
  TeamDto teamWithBallPossession = TeamDto.fixture();

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

  void onReset() {
    onStop();
    teamA = teamA.copyWith(score: 0);
    teamB = teamB.copyWith(score: 0);
    teamWithBallPossession = teamA;
    notifyListeners();
  }

  void incrementTeamAScore() {
    final newScore = teamA.score + 1;
    teamA = teamA.copyWith(score: newScore);
    teamWithBallPossession = teamA;
    notifyListeners();
  }

  void incrementTeamBScore() {
    final newScore = teamB.score + 1;
    teamB = teamB.copyWith(score: newScore);
    teamWithBallPossession = teamB;
    notifyListeners();
  }

  void decrementTeamAScore() {
    if (teamA.score > 0) {
      final newScore = teamA.score - 1;
      teamA = teamA.copyWith(score: newScore);
    }
    notifyListeners();
  }

  void decrementTeamBScore() {
    if (teamB.score > 0) {
      final newScore = teamB.score - 1;
      teamB = teamB.copyWith(score: newScore);
    }
    notifyListeners();
  }
}
