import 'package:advent_of_code_21/grid/markable.dart';
import 'package:advent_of_code_21/solver.dart';

import 'helpers/instruction.dart';
import 'helpers/paper.dart';

class Day13Part1 extends Solver {
  Day13Part1() : super(13);

  @override
  String solve(List<String> input) {
    final coordinates = <String>[];
    final instructions = <FoldInstruction>[];

    for (var i in input) {
      if (i.isEmpty) {
        // delimiter between coordinates and instructions
        continue;
      } else if (i.startsWith("f")) {
        instructions.add(FoldInstruction.parse(i));
      } else {
        coordinates.add(i);
      }
    }

    final paper = Paper.fromCoordinates(coordinates);
    paper.fold(instructions.first);

    return paper.countMarked().toString();
  }
}
