import 'package:advent_of_code_21/solver.dart';

import 'helpers/converger.dart';

class Day7Part1 extends Solver {
  Day7Part1() : super(7);

  @override
  String solve(List<String> input) {
    final positions = input[0].split(",").map((s) => int.parse(s)).toList();
    final converger = Converger.fromPositions(positions);

    while (!converger.hasConverged()) {
      converger.converge();
    }

    return converger.fuel.toString();
  }
}
