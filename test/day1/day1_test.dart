import 'dart:io';

import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_21/solver.dart';

import '../../bin/day1/d1p1.dart';
import '../../bin/day1/d1p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(1);
  });
  test("test d1p1's solve method", () {
    solver = Day1Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("7"));
  });
  test("test d1p2's solve method", () {
    solver = Day1Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals("5"));
  });
}
