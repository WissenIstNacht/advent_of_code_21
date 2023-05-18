import 'dart:math';

import 'probe.dart';
import 'simulator.dart';
import 'targetArea.dart';

void main() {
  var ta = TargetArea.parse("x=20..30, y=-10..-5");
  var probe = Probe.atOrigin(6, 0);
  var simulator = Simulator(ta);

  if (simulator.hitsArea(probe)) {
    print(true);
  } else {
    print(false);
  }
}

void minVelocity() {
  for (var i = 0; i < 20; i++) {
    var minXVel = (sqrt(1 + 8 * i) - 1) / 2;
    print(
        "For a TA with a left boundary at $i, the minimum required velocity is ${minXVel.ceil()}");
  }
}

void showAcceleartions() {
  var velocities =
      velocitiesRaw.split(RegExp(r"\s+")).map((s) => Point.parse(s)).toList();
  velocities.sort();
  var accelarations = <int>[];
  for (var i = 0; i < velocities.length - 1; i++) {
    accelarations.add(velocities[i + 1].x - velocities[i].x);
  }
  print(accelarations);
}

void showSortedVelocities() {
  var velocities =
      velocitiesRaw.split(RegExp(r"\s+")).map((s) => Point.parse(s)).toList();
  velocities.sort();
  print(velocities);
}

class Point extends Comparable<Point> {
  late int x, y;

  Point.parse(String s) {
    var substrings = s.split(",");
    x = int.parse(substrings.first);
    y = int.parse(substrings.last);
  }

  @override
  int compareTo(other) {
    if (x < other.x) {
      return -1;
    } else if (x > other.x) {
      return 1;
    } else {
      if (y < other.y) {
        return -1;
      } else if (y > other.y) {
        return 1;
      } else {
        return 0;
      }
    }
  }

  @override
  String toString() {
    return "($x,$y)";
  }
}

const velocitiesRaw = """
23,-10  25,-9   27,-5   29,-6   22,-6   21,-7   9,0     27,-7   24,-5
25,-7   26,-6   25,-5   6,8     11,-2   20,-5   29,-10  6,3     28,-7
8,0     30,-6   29,-8   20,-10  6,7     6,4     6,1     14,-4   21,-6
26,-10  7,-1    7,7     8,-1    21,-9   6,2     20,-7   30,-10  14,-3
20,-8   13,-2   7,3     28,-8   29,-9   15,-3   22,-5   26,-8   25,-8
25,-6   15,-4   9,-2    15,-2   12,-2   28,-9   12,-3   24,-6   23,-7
25,-10  7,8     11,-3   26,-7   7,1     23,-9   6,0     22,-10  27,-6
8,1     22,-8   13,-4   7,6     28,-6   11,-4   12,-4   26,-9   7,4
24,-10  23,-8   30,-8   7,0     9,-1    10,-1   26,-5   22,-9   6,5
7,5     23,-6   28,-10  10,-2   11,-1   20,-9   14,-2   29,-7   13,-3
23,-5   24,-8   27,-9   30,-7   28,-5   21,-10  7,9     6,6     21,-5
27,-10  7,2     30,-9   21,-8   22,-7   24,-9   20,-6   6,9     29,-5
8,-2    27,-8   30,-5   24,-7""";
