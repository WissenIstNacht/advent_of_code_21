import 'package:advent_of_code_21/solver.dart';

import 'helpers/line.dart';

class Day10Part2 extends Solver {
  Day10Part2() : super(10);

  @override
  String solve(List<String> input) {
    final lines = input.map((l) => Line.parse(l)).toList();
    lines.forEach((l) => l.analyze());
    final scores = lines
        .where((l) => !l.isCorrupted())
        .map((l) => l.getCompletion())
        .map((completion) {
      int folder(int elem, int curr) => curr * 5 + elem;
      completion.map((t) => t.completionValue()).fold(0, folder);
    }).toList();
    scores.sort();

    return scores[(scores.length / 2).floor()].toString();
  }
}
