import 'package:advent_of_code_21/solver.dart';

import 'helpers/parser.dart';
import 'helpers/sfn.dart';

class Day18Part1 extends Solver {
  Day18Part1() : super(18);

  @override
  String solve(List<String> input) {
    var sfns = input.map(parse).toList();
    var res = sum(sfns);
    return res.magnitude().toString();
  }

  SFN sum(List<SFN> sfns) {
    // assuming there is at least 3 numbers.
    var res = sfns.first;
    for (var i = 1; i < sfns.length; i++) {
      res = res.add(sfns[i]);
    }
    return res;
  }
}
