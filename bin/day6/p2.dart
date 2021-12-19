import 'package:advent_of_code_21/solver.dart';

class Day6Part2 extends Solver {
  Day6Part2() : super(6);

  @override
  String solve(List<String> input) {
    final totalDays = 256;
    final effectiveCount = List.filled(totalDays + 10, 0);
    final repoducableCount = List.filled(totalDays + 10, 0);

    input[0].split(",").map((s) => int.parse(s)).forEach((i) {
      repoducableCount[i]++;
    });

    effectiveCount[0] = repoducableCount.reduce((a, b) => a + b);
    for (var i = 0; i <= totalDays; i++) {
      repoducableCount[i + 7] += repoducableCount[i];
      repoducableCount[i + 9] += repoducableCount[i];
      effectiveCount[i + 1] += effectiveCount[i] + repoducableCount[i];
    }

    return effectiveCount[totalDays].toString();
  }
}
