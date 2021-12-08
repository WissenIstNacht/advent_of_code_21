import 'dart:math';
import 'package:collection/collection.dart';

import 'package:advent_of_code_21/solver.dart';

class Day3Part1 extends Solver {
  Day3Part1() : super(3);

  @override
  String solve(List<String> input) {
    final s = input.first;
    final rows = input.length;
    final cols = s.length;
    final acc = List<int>.filled(cols, 0);

    List<int> folder(List<int> acc, String val) {
      val.runes.forEachIndexed((index, elem) {
        if (elem.toString() == "1") {
          acc[index] += 1;
        }
      });
      return acc;
    }

    input.fold(acc, folder);

    final gammaArray = acc.map((n) => (n / rows).round());
    final gamma = gammaArray
        .mapIndexed((index, elem) => elem == 1 ? pow(2, cols - index) : 0)
        .reduce((a, b) => a + b);
    final epsilon = pow(2, cols) - (1 + gamma);
    return (gamma * epsilon).toString();
  }
}
