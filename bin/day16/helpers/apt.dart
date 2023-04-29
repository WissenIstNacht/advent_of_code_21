class APT {
  Packet root;

  APT(this.root);

  int evaluate() {
    return root.evaluate();
  }

  int versionNumberSum() {
    return _versionNumberSum(root);
  }

  int _versionNumberSum(Packet p) {
    var sum = 0;
    if (p is OperatorPacket) {
      for (var sp in p.subPackets) {
        sum += _versionNumberSum(sp);
      }
    }

    return sum + p.versionId;
  }
}

abstract class Packet {
  int versionId;
  int typeId;

  Packet(this.versionId, this.typeId);

  int evaluate();
}

class OperatorPacket extends Packet {
  List<Packet> subPackets = [];

  OperatorPacket(versionId, typeId, this.subPackets) : super(versionId, typeId);

  @override
  int evaluate() {
    switch (typeId) {
      case 0:
        return subPackets.fold(0, (int curr, p) => curr + p.evaluate());
      case 1:
        return subPackets.fold(1, (int curr, p) => curr * p.evaluate());
      case 2:
        return subPackets.fold(99999999999, (int curr, p) {
          var packetValue = p.evaluate();
          return packetValue < curr ? packetValue : curr;
        });
      case 3:
        return subPackets.fold(0, (int curr, p) {
          var packetValue = p.evaluate();
          return packetValue > curr ? packetValue : curr;
        });
      case 5:
        return subPackets[0].evaluate() > subPackets[1].evaluate() ? 1 : 0;
      case 6:
        return subPackets[0].evaluate() < subPackets[1].evaluate() ? 1 : 0;
      case 7:
        return subPackets[0].evaluate() == subPackets[1].evaluate() ? 1 : 0;
      default:
        throw Error();
    }
  }
}

class NumberPacket extends Packet {
  int number;

  NumberPacket(versionId, typeId, this.number) : super(versionId, typeId);

  @override
  int evaluate() {
    return number;
  }
}
