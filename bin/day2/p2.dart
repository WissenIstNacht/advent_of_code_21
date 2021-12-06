import 'package:advent_of_code_21/solver.dart';

import 'instruction.dart';
import 'position.dart';

class Day2Part2 extends Solver {
  Day2Part2() : super(2);

  @override
  String solve(List<String> input) {
    final instrs = input.map((s) => Instruction.parse(s));
    final pos = Position2();
    instrs.forEach(pos.move);
    final res = pos.depth * pos.horizontal;
    return res.toString();
  }
}
