class Display {
  final Map<String, int> decoder = {};

  late List<String> inputs, outputs;

  Display.parse(String s) {
    final parts = s.split(" | ");
    inputs = parts.first.split(" ");
    outputs = parts.last.split(" ");
  }

  void decodeInputs() {
    final fivers = <String>[], sixers = <String>[];
    var no1;
    for (var input in inputs) {
      switch (input.length) {
        case 2:
          decoder[input] = 1;
          no1 = input;
          break;
        case 3:
          decoder[input] = 7;
          break;
        case 4:
          decoder[input] = 4;
          break;
        case 7:
          decoder[input] = 8;
          break;
        case 5:
          fivers.add(input);
          break;
        case 6:
          sixers.add(input);
          break;
        default:
          throw FallThroughError();
      }
    }

    final no6 = sixers.firstWhere((s) => !covers(s, no1));
    decoder[no6] = 6;
    sixers.remove(no6);

    final no3 = fivers.firstWhere((s) => covers(s, no1));
    decoder[no3] = 3;
    fivers.remove(no3);

    final no0 = sixers.firstWhere((s) => !covers(s, no3));
    sixers.remove(no0);
    decoder[no0] = 0;

    assert(sixers.length == 1);
    final no9 = sixers.first;
    decoder[no9] = 9;

    final no5 = fivers.firstWhere((s) {
      final unionOneFive = unionFiveOne(s, no1);
      return covers(unionOneFive, no9) && covers(no9, unionOneFive);
    });
    decoder[no5] = 5;
    fivers.remove(no5);

    assert(fivers.length == 1);
    decoder[fivers.first] = 2;
  }

  String unionFiveOne(String five, String one) {
    assert(one.length == 2);
    if (five.contains(one[0])) {
      return five + one[1];
    } else {
      return five + one[0];
    }
  }

  bool covers(String s1, String s2) {
    for (var i = 0; i < s2.length; i++) {
      if (!s1.contains(s2[i])) return false;
    }
    return true;
  }

  int decodeOutputs() {
    return outputs
        .map((s) => decoder[s] ?? 123456)
        .reduce((aggr, elem) => (aggr * 10 + elem));
  }
}
