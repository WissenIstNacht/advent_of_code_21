import 'package:advent_of_code_21/solver.dart';

import 'd1p1.dart';

class Day1Part2 extends Solver {
  Day1Part2() : super(1);

  @override
  String solve(List<String> input) {
    final numberInput = input.map(int.parse).toList();
    final windowSums = <int>[];

    for (var i = 0; i < numberInput.length - 2; i++) {
      final window = numberInput.sublist(i, i + 3);
      final sum = window.reduce((a, b) => a + b);
      windowSums.add(sum);
    }

    final res = Day1Part1.countIncreases(windowSums);
    return res.toString();
  }
}
