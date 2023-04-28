import 'package:test/test.dart';

import '../../bin/day16/helpers/apt.dart';

void main() {
  test("get binary string from hex signal", () {
    final rootPacket =
        OperatorPacket(1, 1, [NumberPacket(2, 1, 42), NumberPacket(3, 1, 42)]);
    final apt = APT(rootPacket);
    final res = apt.versionNumberSum();
    expect(res, equals(6));
  });
}
