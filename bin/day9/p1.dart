import 'package:advent_of_code_21/solver.dart';

import 'helpers/heightMap.dart';

class Day9Part1 extends Solver {
  Day9Part1() : super(9);

  @override
  String solve(List<String> input) {
    final heightMap = HeightMap.parse(input);
    final points = heightMap.findLowPoints();
    final res = points.map((p) => p += 1).reduce((a, b) => a + b);

    return res.toString();
  }
}
