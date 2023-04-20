import 'package:advent_of_code_21/solver.dart';

class Day14Part2 extends Solver {
  final rules = <String, String>{};
  final polymerElements = <String, int>{};
  final stepCount = 39;

  Day14Part2() : super(14);

  @override
  String solve(List<String> input) {
    final polymerTemplate = input.removeAt(0);
    input.removeAt(0);

    for (var i in input) {
      final newKey = i.substring(0, 2);
      final newValue = i.substring(6);
      rules[newKey] = newValue;
    }

    polymerizationAnalysis(polymerTemplate);
    final diff = elementDifference();
    print(polymerElements.toString());
    return diff.toString();
  }

  void polymerizationAnalysis(String start) {
    for (var i = 0; i < start.length - 1; i++) {
      final left = start[i];
      final right = start[i + 1];
      polymerElements.update(left, (val) => val + 1, ifAbsent: () => 1);
      replace(left, right, 0);
    }
    polymerElements.update(start[start.length - 1], (val) => val + 1,
        ifAbsent: () => 1);
  }

  int elementDifference() {
    var min = 9007199254740991;
    var max = 0;
    for (var count in polymerElements.values) {
      if (count > max) {
        max = count;
      }
      if (count < min) {
        min = count;
      }
    }
    print(max);
    print(min);
    return max - min;
  }

  void replace(String left, String right, depth) {
    final combination = rules[left + right];

    if (combination == null) {
      throw Error();
    }
    polymerElements.update(combination, (val) => val + 1, ifAbsent: () => 1);
    if (depth == stepCount) {
      return;
    }
    replace(left, combination, depth + 1);
    replace(combination, right, depth + 1);
    return;
  }
}
