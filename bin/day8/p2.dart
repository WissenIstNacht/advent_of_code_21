import 'package:advent_of_code_21/solver.dart';

import 'helpers/display.dart';

class Day8Part2 extends Solver {
  Day8Part2() : super(8);

  @override
  String solve(List<String> input) {
    final displays = input.map((l) => Display.parse(l));
    var counter = 0;
    for (var display in displays) {
      display.decodeInputs();
      counter += display.decodeOutputs();
    }
    return counter.toString();
  }
}
