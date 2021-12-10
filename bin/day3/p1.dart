import 'dart:math';
import 'package:collection/collection.dart';

import 'package:advent_of_code_21/solver.dart';

import 'utils.dart';

class Day3Part1 extends Solver {
  Day3Part1() : super(3);

  @override
  String solve(List<String> input) {
    final s = input.first;
    final rows = input.length;
    final cols = s.length;
    final init = List<int>.filled(cols, 0);

    List<int> folder(List<int> acc, String val) {
      for (var i = 0; i < val.length; i++) {
        if (val.substring(i, i + 1) == "1") {
          acc[i] += 1;
        }
      }
      return acc;
    }

    final mostSignificantBit = input.fold(init, folder);

    final gammaBits = mostSignificantBit.map((n) => (n / rows).round());
    final gamma = bitsToInt(gammaBits);
    final epsilon = pow(2, cols) - (1 + gamma);
    return (gamma * epsilon).toString();
  }
}
