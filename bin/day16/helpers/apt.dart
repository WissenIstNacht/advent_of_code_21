class APT {
  Packet root;

  APT(this.root);

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
}

class OperatorPacket extends Packet {
  List<Packet> subPackets = [];

  OperatorPacket(versionId, typeId, this.subPackets) : super(versionId, typeId);
}

class NumberPacket extends Packet {
  int number;

  NumberPacket(versionId, typeId, this.number) : super(versionId, typeId);
}
