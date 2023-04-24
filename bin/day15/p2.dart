import 'package:advent_of_code_21/solver.dart';

import 'helpers/risk_map.dart';
import 'p1.dart';

class Day15Part2 extends Solver {
  Day15Part2() : super(15);

  @override
  String solve(List<String> input) {
    // create 5 variations for each line in the input
    final lineVariations = createLineVariations(input);
    final extendedInput = createExtendedInput(lineVariations);

    final riskMap = RiskMap.parse(extendedInput);
    final res = Day15Part1.dijktra(riskMap);
    return res.toString();
  }

  List<List<String>> createLineVariations(List<String> input) {
    final n = input.length;

    return List.generate(n, (j) {
      final currLine = input[j].split("").map((char) => int.parse(char));
      return List.generate(9, (index) {
        return currLine.map((val) {
          var newValue = val + index;
          if (newValue > 9) {
            newValue = newValue % 9;
          }
          return newValue.toString();
        }).join();
      });
    });
  }

  List<String> createExtendedInput(List<List<String>> lineVariations) {
    final n = lineVariations.length;

    final lines = <String>[];
    for (var k = 0; k < 5; k++) {
      for (var j = 0; j < n; j++) {
        var newLine = "";
        for (var i = 0; i < 5; i++) {
          newLine += lineVariations[j][(k + i) % 9];
        }
        lines.add(newLine);
      }
    }
    return lines;
  }
}
