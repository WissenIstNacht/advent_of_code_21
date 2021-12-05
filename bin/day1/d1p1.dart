import 'package:advent_of_code_21/solver.dart';

import 'utils.dart';

class Day1Part1 extends Solver {
  Day1Part1() : super(1);

  @override
  String solve(List<String> input) {
    final numberInput = input.map(int.parse).toList();
    return countIncreases(numberInput).toString();
  }
}
