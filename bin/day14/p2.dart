import 'package:advent_of_code_21/solver.dart';

class Day14Part2 extends Solver {
  final rules = <String, String>{};
  final polymerElements = <String, int>{};
  final stepCount = 40;
  var pairCounts = <String, int>{};

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

    initializePairCount(polymerTemplate);
    initializeElementCount(polymerTemplate);
    polymerize();

    final diff = elementDifference();
    return diff.toString();
  }

  void polymerize() {
    for (var i = 0; i < stepCount; i++) {
      var newPairCounts = <String, int>{};
      for (var pairCount in pairCounts.entries) {
        final newElement = rules[pairCount.key];

        if (newElement == null) {
          throw Error();
        }
        polymerElements.update(newElement, (val) => val + pairCount.value,
            ifAbsent: () => pairCount.value);
      }

      for (var pairCount in pairCounts.entries) {
        final newElement = rules[pairCount.key];

        if (newElement == null) {
          throw Error();
        }

        var newLeftPair = pairCount.key[0] + newElement;
        var newRightPair = newElement + pairCount.key[1];

        newPairCounts.update(newLeftPair, (val) => val + pairCount.value,
            ifAbsent: () => pairCount.value);
        newPairCounts.update(newRightPair, (val) => val + pairCount.value,
            ifAbsent: () => pairCount.value);
      }
      pairCounts = newPairCounts;
    }
  }

  void initializePairCount(String polymerTemplate) {
    for (var i = 0; i < polymerTemplate.length - 1; i++) {
      final pair = polymerTemplate.substring(i, i + 2);
      pairCounts.update(pair, (val) => val + 1, ifAbsent: () => 1);
    }
  }

  void initializeElementCount(String polymerTemplate) {
    for (var i = 0; i < polymerTemplate.length; i++) {
      var element = polymerTemplate[i];
      polymerElements.update(element, (val) => val + 1, ifAbsent: () => 1);
    }
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
    return max - min;
  }
}
