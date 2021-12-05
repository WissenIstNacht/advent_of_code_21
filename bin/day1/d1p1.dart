import 'package:advent_of_code_21/solver.dart';

class Day1Part1 extends Solver {
  Day1Part1() : super(1);

  @override
  String solve(List<String> input) {
    final numberInput = input.map((String e) {
      return int.parse(e);
    }).toList();
    var counter = 0;
    for (var i = 0; i < numberInput.length - 1; i++) {
      final curr = numberInput[i];
      final next = numberInput[i + 1];
      if (isIncreasing(curr, next)) {
        counter++;
      }
    }
    return counter.toString();
  }

  bool isIncreasing(num a, num b) => b - a > 0;
}
