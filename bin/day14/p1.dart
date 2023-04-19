import 'package:advent_of_code_21/solver.dart';

class Day14Part1 extends Solver {
  final rules = <String, String>{};
  final stepCount = 9;
  Day14Part1() : super(14);

  @override
  String solve(List<String> input) {
    final start = input.removeAt(0);
    input.removeAt(0);

    for (var i in input) {
      final newKey = i.substring(0, 2);
      final newValue = i.substring(6);
      rules[newKey] = newValue;
    }

    final polymer = polymerize(start);

    return elementDifference(polymer).toString();
  }

  String polymerize(String start) {
    var res = "";
    for (var i = 0; i < start.length - 1; i++) {
      final left = start[i];
      final right = start[i + 1];
      res += left;
      res += replace(left, right, 0);
    }
    res += start[start.length - 1];
    return res;
  }

  int elementDifference(String polymer) {
    final elemCount = <String, int>{};
    for (var i = 0; i < polymer.length; i++) {
      elemCount.update(polymer[i], (val) => val + 1, ifAbsent: () => 0);
    }

    var min = polymer.length;
    var max = 0;
    for (var count in elemCount.values) {
      if (count > max) {
        max = count;
      }
      if (count < min) {
        min = count;
      }
    }
    return max - min;
  }

  String replace(String left, String right, depth) {
    final combination = rules[left + right];
    if (combination == null) {
      throw Error();
    }
    if (depth == stepCount) return combination;
    return replace(left, combination, depth + 1) +
        combination +
        replace(combination, right, depth + 1);
  }
}
