import 'package:advent_of_code_21/solver.dart';

class Day1Part1 extends Solver {
  Day1Part1() : super(1);

  @override
  String solve(List<String> input) {
    final numberInput = input.map(int.parse).toList();
    return countIncreases(numberInput).toString();
  }

  static int countIncreases(List<int> input) {
    var counter = 0;
    for (var i = 0; i < input.length - 1; i++) {
      final curr = input[i];
      final next = input[i + 1];
      if (isIncreasing(curr, next)) {
        counter++;
      }
    }
    return counter;
  }

  static bool isIncreasing(num a, num b) => b - a > 0;
}
