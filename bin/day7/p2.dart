import 'package:advent_of_code_21/solver.dart';

// Notes on the solution
//
// The solution is computed by finding the mean of the horizontal positions.
// The justification for this solution is that this puzzle essentially asks to
// perform linear least squares approximation on the given data.
//
// This does not make much sense if one thinks about the data as the one
// dimensional array of values given. But by enumerating the values one can
// create a discrete function (basically, like plotting the height of each data
// point on a grid). This then allows to fit a line through the data.
//
// The realation to the mean stems from the fact that the fitted line must be
// constant. This constant line represents the point in which all crabs meet
// (imagine the afore mentioned plot with a horizontal line through it). Fitting
// a constant line to a set of data results in simply taking the mean over the
// dependent variable. I.e., over the horizontal positions.
//
// Note that the data is poorly chosen, as it matters whether the floor or
// ceiling is chosen to round the mean. For example, the sample data provided
// along the puzzle can only be solved by using the ceil() function. The
// official puzzle input, however, requires the floor() function to round.

class Day7Part2 extends Solver {
  Day7Part2() : super(7);

  @override
  String solve(List<String> input) {
    final positions = input[0].split(",").map((s) => int.parse(s));
    final total = positions.reduce((a, b) => a + b);
    final avg = (total / positions.length).floor();

    var fuel = 0;
    for (var pos in positions) {
      fuel += computeFuel(pos, avg);
    }
    return fuel.toString();
  }

  // TODO this can be improved by computing it directly using the respective
  // formula.
  int computeFuel(from, to) {
    final d = (from - to).abs();
    var fuel = 0;
    for (var i = 1; i <= d; i++) {
      fuel += i;
    }
    return fuel;
  }
}
