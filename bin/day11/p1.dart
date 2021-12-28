import 'package:advent_of_code_21/solver.dart';

import 'helpers/cavern.dart';

class Day11Part1 extends Solver {
  Day11Part1() : super(11);

  @override
  String solve(List<String> input) {
    final cavern = Cavern.parse(input);
    for (var i = 0; i < 100; i++) {
      cavern.step();
    }

    return cavern.flashCount.toString();
  }
}
