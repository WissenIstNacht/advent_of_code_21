import 'package:advent_of_code_21/solver.dart';

import 'grid.dart';
import 'line.dart';
import 'utils.dart';

class Day5Part1 extends Solver {
  Day5Part1() : super(5);

  @override
  String solve(List<String> input) {
    final lines =
        input.map((s) => Line.fromString(s)).where((line) => line.isAxial());

    final dimensions = findDimensions(lines);
    final grid = Grid.fromDimension(dimensions.x, dimensions.y);

    lines.forEach((line) => grid.markLine(line));
    return grid.countOverlaps().toString();
  }
}
