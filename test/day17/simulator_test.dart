import 'package:test/test.dart';

import '../../bin/day17/helpers/probe.dart';
import '../../bin/day17/helpers/simulator.dart';
import '../../bin/day17/helpers/targetArea.dart';

void main() {
  test("simulate probe landing in target area 1", () {
    final probe = Probe.atOrigin(7, 2);
    final targetArea = TargetArea.parse("x=20..30, y=-10..-5");
    final simulator = Simulator(probe, targetArea);
    simulator.simulate();

    final res = probe.isInArea(targetArea);
    expect(res, isTrue);
  });
  test("simulate probe landing in target area 2", () {
    final probe = Probe.atOrigin(6, 3);
    final targetArea = TargetArea.parse("x=20..30, y=-10..-5");
    final simulator = Simulator(probe, targetArea);
    simulator.simulate();

    final res = probe.isInArea(targetArea);
    expect(res, isTrue);
  });
  test("simulate probe landing in target area 3", () {
    final probe = Probe.atOrigin(9, 0);
    final targetArea = TargetArea.parse("x=20..30, y=-10..-5");
    final simulator = Simulator(probe, targetArea);
    simulator.simulate();

    final res = probe.isInArea(targetArea);
    expect(res, isTrue);
  });
  test("simulate probe landing in target area 3", () {
    final probe = Probe.atOrigin(17, -4);
    final targetArea = TargetArea.parse("x=20..30, y=-10..-5");
    final simulator = Simulator(probe, targetArea);
    simulator.simulate();

    final res = probe.isInArea(targetArea);
    expect(res, isFalse);
  });
}
