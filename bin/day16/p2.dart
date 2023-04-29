import 'package:advent_of_code_21/solver.dart';

import 'helpers/signal.dart';

class Day16Part2 extends Solver {
  Day16Part2() : super(16);

  @override
  String solve(List<String> input) {
    final signal = Signal(input.first);
    final apt = signal.consumeSignal();

    return apt.evaluate().toString();
  }
}
