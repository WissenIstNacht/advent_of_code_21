import 'package:test/test.dart';

import '../../bin/day16/helpers/apt.dart';
import '../../bin/day16/helpers/signal.dart';

void main() {
  test("get binary string from hex signal", () {
    final signal = Signal("D2FE28");
    final res = signal.binarySignal;
    expect(res, equals("110100101111111000101000"));
  });
  test("consume Number Literal", () {
    final res = Signal.consumeNumberLiteral("101111111000101000".split(""));
    expect(res, equals(2021));
  });
  test("consume simple number signal yields correct packet type", () {
    final signal = Signal("D2FE28");
    final res = signal.consumeSignal();
    expect(res.root, isA<NumberPacket>());
  });
  test("consumed simple number signal yields correct number", () {
    final signal = Signal("D2FE28");
    final apt = signal.consumeSignal();
    final res = (apt.root as NumberPacket).number;
    expect(res, equals(2021));
  });
  test("consumed signal with typeLenghtId 0 contains an operator packet", () {
    final signal = Signal("38006F45291200");
    final res = signal.consumeSignal();
    expect(res.root, isA<OperatorPacket>());
  });
  test("consumed signal with typeLenghtId 0 contains correct children", () {
    final signal = Signal("38006F45291200");
    final apt = signal.consumeSignal();
    final opPacket = apt.root as OperatorPacket;
    final res = opPacket.subPackets.map((p) => (p as NumberPacket).number);
    expect(res, equals([10, 20]));
  });
  test("consumed signal with typeLenghtId 1 contains an operator packet", () {
    final signal = Signal("EE00D40C823060");
    final res = signal.consumeSignal();
    expect(res.root, isA<OperatorPacket>());
  });
  test("consumed signal with typeLenghtId 0 contains correct children", () {
    final signal = Signal("EE00D40C823060");
    final apt = signal.consumeSignal();
    final opPacket = apt.root as OperatorPacket;
    final res = opPacket.subPackets.map((p) => (p as NumberPacket).number);
    expect(res, equals([1, 2, 3]));
  });
}
