import 'dart:math';

import 'package:advent_of_code_21/solver.dart';

import 'helpers/probe.dart';
import 'helpers/simulator.dart';
import 'helpers/targetArea.dart';

class Day17Part2 extends Solver {
  Day17Part2() : super(17);

  @override
  String solve(List<String> input) {
    var i = input.first.substring(13);
    var ta = TargetArea.parse(i);

    // min. x velocity to reach targetArea
    var minXVel = ((sqrt(1 + 8 * ta.xLo) - 1) / 2).ceil();
    var maxXVel = ta.xHi;
    var minYVel = ta.yLo > 0 ? ((sqrt(1 + 8 * ta.yLo) - 1) / 2).ceil() : ta.yLo;
    var maxYVel = max(ta.yHi.abs(), ta.yLo.abs());

    var validXVel = findValidX(minXVel, maxXVel, ta);
    var validVelocities = findValidVelocities(validXVel, minYVel, maxYVel, ta);

    return validVelocities.length.toString();
  }

  bool reaches(int n, TargetArea ta) {
    var sum = 0;
    for (var i = n; i > 0; i--) {
      sum += i;
      if (sum >= ta.xLo && sum <= ta.xHi) return true;
    }
    return false;
  }

  List<int> findValidX(int minXVel, int maxXVel, TargetArea ta) {
    var res = <int>[];
    for (var i = minXVel; i <= maxXVel; i++) {
      if (reaches(i, ta)) res.add(i);
    }
    return res;
  }

  List<String> findValidVelocities(
      List<int> validXVel, int minYVel, int maxYVel, TargetArea ta) {
    var res = <String>[];
    validXVel.forEach((xVel) {
      for (var i = minYVel; i <= maxYVel; i++) {
        var probe = Probe.atOrigin(xVel, i);
        var simulator = Simulator(ta);

        if (simulator.hitsArea(probe)) {
          res.add("($xVel,$i)");
        }
      }
    });
    return res;
  }
}
