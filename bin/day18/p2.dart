import 'package:advent_of_code_21/solver.dart';

import 'helpers/parser.dart';

class Day18Part2 extends Solver {
  Day18Part2() : super(18);

  @override
  String solve(List<String> input) {
    var maxMagnitude = 0;
    for (var i = 0; i < input.length; i++) {
      for (var j = 0; j < input.length; j++) {
        if (i == j) {
          continue;
        }
        final sfni = parse(input[i]);
        final sfnj = parse(input[j]);

        final currMagnitude = sfni.add(sfnj).magnitude();
        if (currMagnitude > maxMagnitude) {
          maxMagnitude = currMagnitude;
        }
      }
    }
    return maxMagnitude.toString();
  }
}
