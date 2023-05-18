import 'package:advent_of_code_21/solver.dart';
import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../bin/day17/helpers/targetArea.dart';
import '../../bin/day17/p1.dart';
import '../../bin/day17/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(17);
  });
  test("test d17p1's solve method", () {
    solver = Day17Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("45"));
  });
  test("test d17p2's reaches method 1", () {
    var solver = Day17Part2();
    var ta = TargetArea.parse("x=20..30, y=-10..-5");

    final res = solver.reaches(7, ta);
    expect(res, isTrue);
  });
  test("test d17p2's reaches method 2", () {
    var solver = Day17Part2();
    var ta = TargetArea.parse("x=20..30, y=-10..-5");

    final res = solver.reaches(17, ta);
    expect(res, isFalse);
  });
  test("test d17p2's findValidX method", () {
    var solver = Day17Part2();
    var ta = TargetArea.parse("x=20..30, y=-10..-5");

    final res = solver.findValidX(6, 30, ta);
    print(res);
    expect(
        res,
        equals([
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
          15,
          20,
          21,
          22,
          23,
          24,
          25,
          26,
          27,
          28,
          29,
          30
        ]));
  });
  test("test d17p2's findValidVelocities method", () {
    var solver = Day17Part2();
    var ta = TargetArea.parse("x=20..30, y=-10..-5");
    var validXVel = solver.findValidX(6, 30, ta);
    var res = solver.findValidVelocities(validXVel, -10, 10, ta);
    print(res);
    expect(
        res,
        equals([
          "(6,0)",
          "(6,1)",
          "(6,2)",
          "(6,3)",
          "(6,4)",
          "(6,5)",
          "(6,6)",
          "(6,7)",
          "(6,8)",
          "(6,9)",
          "(7,-1)",
          "(7,0)",
          "(7,1)",
          "(7,2)",
          "(7,3)",
          "(7,4)",
          "(7,5)",
          "(7,6)",
          "(7,7)",
          "(7,8)",
          "(7,9)",
          "(8,-2)",
          "(8,-1)",
          "(8,0)",
          "(8,1)",
          "(9,-2)",
          "(9,-1)",
          "(9,0)",
          "(10,-2)",
          "(10,-1)",
          "(11,-4)",
          "(11,-3)",
          "(11,-2)",
          "(11,-1)",
          "(12,-4)",
          "(12,-3)",
          "(12,-2)",
          "(13,-4)",
          "(13,-3)",
          "(13,-2)",
          "(14,-4)",
          "(14,-3)",
          "(14,-2)",
          "(15,-4)",
          "(15,-3)",
          "(15,-2)",
          "(20,-10)",
          "(20,-9)",
          "(20,-8)",
          "(20,-7)",
          "(20,-6)",
          "(20,-5)",
          "(21,-10)",
          "(21,-9)",
          "(21,-8)",
          "(21,-7)",
          "(21,-6)",
          "(21,-5)",
          "(22,-10)",
          "(22,-9)",
          "(22,-8)",
          "(22,-7)",
          "(22,-6)",
          "(22,-5)",
          "(23,-10)",
          "(23,-9)",
          "(23,-8)",
          "(23,-7)",
          "(23,-6)",
          "(23,-5)",
          "(24,-10)",
          "(24,-9)",
          "(24,-8)",
          "(24,-7)",
          "(24,-6)",
          "(24,-5)",
          "(25,-10)",
          "(25,-9)",
          "(25,-8)",
          "(25,-7)",
          "(25,-6)",
          "(25,-5)",
          "(26,-10)",
          "(26,-9)",
          "(26,-8)",
          "(26,-7)",
          "(26,-6)",
          "(26,-5)",
          "(27,-10)",
          "(27,-9)",
          "(27,-8)",
          "(27,-7)",
          "(27,-6)",
          "(27,-5)",
          "(28,-10)",
          "(28,-9)",
          "(28,-8)",
          "(28,-7)",
          "(28,-6)",
          "(28,-5)",
          "(29,-10)",
          "(29,-9)",
          "(29,-8)",
          "(29,-7)",
          "(29,-6)",
          "(29,-5)",
          "(30,-10)",
          "(30,-9)",
          "(30,-8)",
          "(30,-7)",
          "(30,-6)",
          "(30,-5)"
        ]));
  });
  test("test d17p2's solve method", () {
    solver = Day17Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals("112"));
  });
}
