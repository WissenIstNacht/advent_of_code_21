import 'package:advent_of_code_21/solver.dart';

import 'helpers/cavern.dart';

class Day11Part2 extends Solver {
  Day11Part2() : super(11);

  @override
  String solve(List<String> input) {
    final cavern = Cavern.parse(input);
    var stepCount = 0;
    var lastFlashCount = 0;
    while (cavern.flashCount - lastFlashCount != 100) {
      lastFlashCount = cavern.flashCount;
      cavern.step();
      stepCount++;
    }
    return stepCount.toString();
  }
}
