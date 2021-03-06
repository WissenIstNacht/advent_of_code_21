import 'package:advent_of_code_21/solver.dart';

import 'helpers/instruction.dart';
import 'helpers/position.dart';

class Day2Part1 extends Solver {
  Day2Part1() : super(2);

  @override
  String solve(List<String> input) {
    final instrs = input.map((s) => Instruction.parse(s));
    final pos = Position();
    instrs.forEach(pos.move);
    final res = pos.depth * pos.horizontal;
    return res.toString();
  }
}
