import 'package:test/test.dart';

import '../../../bin/day7/helpers/converger.dart';

void main() {
  final simplePositions = [0, 1, 2];
  final simpleConverger = Converger.fromPositions(simplePositions);
  final complexPositions = [5, 8, 2, 5, 4, 3, 3, 3];
  final complexConverger = Converger.fromPositions(complexPositions);
  test('Properly constructs from positions [0,1,2]', () {
    expect(simpleConverger.lo, equals(0));
    expect(simpleConverger.hi, equals(2));
    expect(simpleConverger.positionCount, equals([1, 1, 1]));
  });
  test('Properly constructs from positions [5,8,2,5,4,3,3,3]', () {
    expect(complexConverger.lo, equals(0));
    expect(complexConverger.hi, equals(8));
    expect(complexConverger.positionCount, equals([0, 0, 1, 3, 1, 2, 0, 0, 1]));
  });
  test('Properly executes first convergence step from positions [0,1,2]', () {
    simpleConverger.converge();

    expect(simpleConverger.lo, equals(0));
    expect(simpleConverger.hi, equals(1));
    expect(simpleConverger.fuel, equals(1));
    expect(simpleConverger.positionCount, equals([1, 2, 1]));
  });
  test('Properly executes second convergence step from positions [0,1,2]', () {
    simpleConverger.converge();

    expect(simpleConverger.lo, equals(1));
    expect(simpleConverger.hi, equals(1));
    expect(simpleConverger.fuel, equals(2));
    expect(simpleConverger.positionCount, equals([1, 3, 1]));
  });
}
