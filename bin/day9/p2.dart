import 'package:advent_of_code_21/solver.dart';

import 'helpers/heightMap.dart';

class Day9Part2 extends Solver {
  Day9Part2() : super(9);

  @override
  String solve(List<String> input) {
    final heightMap = HeightMap.parse(input);
    final points = heightMap.findLowPoints();
    final basinLengths =
        points.map((p) => heightMap.findBasin(p)).map((b) => b.length).toList();
    basinLengths.sort();
    final largestBasins =
        basinLengths.sublist(basinLengths.length - 3, basinLengths.length);
    assert(largestBasins.length == 3);
    final res = largestBasins.reduce((a, b) => a * b);

    return res.toString();
  }
}
