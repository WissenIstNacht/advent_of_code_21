import 'package:advent_of_code_21/solver.dart';

import 'helpers/targetArea.dart';

class Day17Part1 extends Solver {
  Day17Part1() : super(17);

  @override
  String solve(List<String> input) {
    var i = input.first.substring(13);
    var ta = TargetArea.parse(i);
    var y_init = ta.farthestY;

    if (y_init < 0) y_init = y_init.abs() - 1;
    var max_altitude = y_init * (y_init + 1) / 2;

    return max_altitude.toInt().toString();
  }
}
