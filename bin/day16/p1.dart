import 'package:advent_of_code_21/solver.dart';

import 'helpers/signal.dart';

class Day16Part1 extends Solver {
  Day16Part1() : super(16);

  @override
  String solve(List<String> input) {
    final signal = Signal(input.first);
    final apt = signal.consumeSignal();

    return apt.versionNumberSum().toString();
  }
}

List<String> takeAndRemove(List<String> list, int count) {
  final sublist = list.take(count).toList();
  list.removeRange(0, count);
  return sublist;
}
