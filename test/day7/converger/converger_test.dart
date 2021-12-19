import 'package:test/test.dart';

import '../../../bin/day7/helpers/converger.dart';

void main() {
  test('Properly constructs from positions [0,1,2]', () {
    final positions = [0, 1, 2];
    final converger = Converger.fromPositions(positions);
    expect(converger.lo, equals(0));
    expect(converger.hi, equals(2));
    expect(converger.positionCount, equals([1, 1, 1]));
  });
  test('Properly constructs from positions [5,8,2,5,4,3,3,3]', () {
    final positions = [5, 8, 2, 5, 4, 3, 3, 3];
    final converger = Converger.fromPositions(positions);
    expect(converger.lo, equals(0));
    expect(converger.hi, equals(8));
    expect(converger.positionCount, equals([0, 0, 1, 3, 1, 2, 0, 0, 1]));
  });
}
