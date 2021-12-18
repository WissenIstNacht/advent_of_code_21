import 'package:test/test.dart';

import '../../../bin/day6/helpers/fish.dart';

void main() {
  test('Can reproduce iff age is 0', () {
    final f1 = Fish();
    final f2 = Fish.withOffset(2);
    final f3 = Fish.withOffset(0);

    expect(f1.canReproduce(), isFalse);
    expect(f2.canReproduce(), isFalse);
    expect(f3.canReproduce(), isTrue);
  });
  test('Age correctly', () {
    final f1 = Fish();
    final f2 = Fish.withOffset(1);
    final f3 = Fish.withOffset(0);

    f1.age();
    f2.age();
    f3.age();

    expect(f1.daysToReproduce, 7);
    expect(f2.daysToReproduce, 0);
    expect(f2.canReproduce(), isTrue);
    expect(f3.daysToReproduce, 6);
  });
  test("Reproduce correctly", () {
    final f = Fish.withOffset(0);
    final g = f.reproduce();

    expect(g.daysToReproduce, equals(8));
  });
}
