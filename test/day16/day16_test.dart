import 'package:test/test.dart';

import '../../bin/day16/p1.dart';
import '../../bin/day16/p2.dart';

void main() {
  test("d16 p1 solve method 1", () {
    final solver = Day16Part1();
    final res = solver.solve(["8A004A801A8002F478"]);
    expect(res, equals("16"));
  });
  test("d16 p1 solve method 2", () {
    final solver = Day16Part1();
    final res = solver.solve(["620080001611562C8802118E34"]);
    expect(res, equals("12"));
  });
  test("d16 p1 solve method 3", () {
    final solver = Day16Part1();
    final res = solver.solve(["C0015000016115A2E0802F182340"]);
    expect(res, equals("23"));
  });
  test("d16 p1 solve method 4", () {
    final solver = Day16Part1();
    final res = solver.solve(["A0016C880162017C3686B18A3D4780"]);
    expect(res, equals("31"));
  });
  test("d16 p2 solve method sum apt", () {
    final solver = Day16Part2();
    final res = solver.solve(["C200B40A82"]);
    expect(res, equals("3"));
  });
  test("d16 p2 solve method product apt", () {
    final solver = Day16Part2();
    final res = solver.solve(["04005AC33890"]);
    expect(res, equals("54"));
  });
  test("d16 p2 solve method on min apt", () {
    final solver = Day16Part2();
    final res = solver.solve(["880086C3E88112"]);
    expect(res, equals("7"));
  });
  test("d16 p2 solve method on max apt", () {
    final solver = Day16Part2();
    final res = solver.solve(["CE00C43D881120"]);
    expect(res, equals("9"));
  });
  test("d16 p2 solve method on GT apt", () {
    final solver = Day16Part2();
    final res = solver.solve(["D8005AC2A8F0"]);
    expect(res, equals("1"));
  });
  test("d16 p2 solve method on LT apt", () {
    final solver = Day16Part2();
    final res = solver.solve(["F600BC2D8F"]);
    expect(res, equals("0"));
  });
  test("d16 p2 solve method on EQ apt", () {
    final solver = Day16Part2();
    final res = solver.solve(["9C005AC2F8F0"]);
    expect(res, equals("0"));
  });
  test("d16 p2 solve method on nested expression apt", () {
    final solver = Day16Part2();
    final res = solver.solve(["9C0141080250320F1802104A08"]);
    expect(res, equals("1"));
  });
}
