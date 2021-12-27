import 'package:advent_of_code_21/solver.dart';

import 'helpers/line.dart';

class Day10Part1 extends Solver {
  Day10Part1() : super(10);

  @override
  String solve(List<String> input) {
    final lines = input.map((l) => Line.parse(l)).toList();
    var errorScore = 0;
    for (var line in lines) {
      line.analyzeLine();
      errorScore += line.errorValue();
    }

    return errorScore.toString();
  }
}
