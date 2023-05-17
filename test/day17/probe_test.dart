import 'package:test/test.dart';

import '../../bin/day17/helpers/probe.dart';
import '../../bin/day17/helpers/targetArea.dart';

void main() {
  late TargetArea targetArea;

  setUp(() {
    targetArea = TargetArea.parse("x=20..30, y=-10..-5");
  });
  test("move probe one step", () {
    final probe = Probe.atOrigin(7, 2);
    probe.move(0);
    final res = <int>[probe.posX, probe.posY];
    expect(res, equals([7, 2]));
  });
  test("move probe two step", () {
    final probe = Probe.atOrigin(7, 2);
    probe.move(0);
    probe.move(1);
    final res = <int>[probe.posX, probe.posY];
    expect(res, equals([13, 3]));
  });
  test("is probe not in area", () {
    final probe = Probe(13, 3, 7, 2);

    final res = probe.isInArea(targetArea);
    expect(res, isFalse);
  });
  test("is probe in area", () {
    final probe = Probe(25, -6, 7, 2);

    probe.posX = 25;
    probe.posY = -6;
    final res = probe.isInArea(targetArea);
    expect(res, isTrue);
  });
  test("is probe not past area", () {
    final probe = Probe(25, -6, 7, 2);
    final res = probe.isPastArea(targetArea);
    expect(res, isFalse);
  });
  test("is probe past area x", () {
    final probe = Probe(250, -6, 7, 2);
    final res = probe.isPastArea(targetArea);
    expect(res, isTrue);
  });
  test("is probe past area y", () {
    final probe = Probe(25, -60, 7, 2);
    final res = probe.isPastArea(targetArea);
    expect(res, isTrue);
  });
}
