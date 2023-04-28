import '../p1.dart';
import 'apt.dart';

class Signal {
  String hexSignal;

  Signal(this.hexSignal);

  String get binarySignal {
    return hexSignal
        .split("")
        .map((letter) => int.parse(letter, radix: 16))
        .map((number) => number.toRadixString(2).padLeft(4, "0"))
        .join();
  }

  APT consumeSignal() {
    final packet = _consumeSignal(binarySignal.split(""));
    return APT(packet);
  }

  Packet _consumeSignal(List<String> signal) {
    var versionId = int.parse(takeAndRemove(signal, 3).join(), radix: 2);
    var typeId = int.parse(takeAndRemove(signal, 3).join(), radix: 2);

    if (typeId == 4) {
      final number = consumeNumberLiteral(signal);
      return NumberPacket(versionId, typeId, number);
    } else {
      final length_type_id = int.parse(takeAndRemove(signal, 1).first);
      if (length_type_id == 1) {
        final packetsCount =
            int.parse(takeAndRemove(signal, 11).join(), radix: 2);
        final packets = <Packet>[];
        for (var i = 0; i < packetsCount; i++) {
          packets.add(_consumeSignal(signal));
        }
        return OperatorPacket(versionId, typeId, packets);
      } else {
        final packetsLength =
            int.parse(takeAndRemove(signal, 15).join(), radix: 2);
        final subSignal = takeAndRemove(signal, packetsLength);

        final packets = <Packet>[];
        while (subSignal.isNotEmpty) {
          packets.add(_consumeSignal(subSignal));
        }
        return OperatorPacket(versionId, typeId, packets);
      }
    }
  }

  static int consumeNumberLiteral(List<String> binSignal) {
    var binNumber = "";
    while (takeAndRemove(binSignal, 1).first == "1") {
      final binGroup = takeAndRemove(binSignal, 4).join();
      binNumber += binGroup;
    }
    final binGroup = takeAndRemove(binSignal, 4).join();
    binNumber += binGroup;

    return int.parse(binNumber, radix: 2);
  }
}
