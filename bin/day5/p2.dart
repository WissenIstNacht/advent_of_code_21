import 'package:advent_of_code_21/solver.dart';

import 'helpers/grid.dart';
import 'helpers/line.dart';
import 'helpers/utils.dart';

class Day5Part2 extends Solver {
  Day5Part2() : super(5);

  @override
  String solve(List<String> input) {
    final lines = input.map((s) => Line.fromString(s));

    final dimensions = findDimensions(lines);
    final grid = Grid.fromDimension(dimensions.x, dimensions.y);

    lines.forEach((line) => grid.markLine(line));
    return grid.countOverlaps().toString();
  }
}
