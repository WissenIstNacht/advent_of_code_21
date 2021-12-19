import 'package:advent_of_code_21/solver.dart';

class Day7Part2 extends Solver {
  Day7Part2() : super(7);

  @override
  String solve(List<String> input) {
    final positions = input[0].split(",").map((s) => int.parse(s));
    final total = positions.reduce((a, b) => a + b);
    print(total);
    final avg = (total / positions.length).round();

    var fuel = 0;
    for (var pos in positions) {
      fuel += computeFuel(pos, avg);
    }
    print(fuel);
    return "5";
  }

  int computeFuel(from, to) {
    final d = (from - to).abs();
    var fuel = 0;
    for (var i = 1; i <= d; i++) {
      fuel += i;
    }
    return fuel;
  }
}
