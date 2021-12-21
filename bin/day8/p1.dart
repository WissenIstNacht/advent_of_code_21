import 'package:advent_of_code_21/solver.dart';

class Day8Part1 extends Solver {
  Day8Part1() : super(8);

  @override
  String solve(List<String> input) {
    final outputs =
        input.map((s) => s.split("|")).map((pair) => pair.last.trim());

    var digitsCount = 0;
    for (var output in outputs) {
      final relevantDigits = output.split(" ").where((digitSignal) {
        return digitSignal.length == 2 || // uniquely identifies digit 1
            digitSignal.length == 3 || // uniquely identifies digit 7
            digitSignal.length == 4 || // uniquely identifies digit 4
            digitSignal.length == 7; // uniquely identifies digit 8
      });
      digitsCount += relevantDigits.length;
    }

    return digitsCount.toString();
  }
}
