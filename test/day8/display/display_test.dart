import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day8/helpers/display.dart';

void main() {
  final sampleInput = readSampleInput(8);
  test('Properly constructs from sample input', () {
    final d = Display.parse(sampleInput.first);
    expect(
        d.inputs,
        equals([
          "be",
          "cfbegad",
          "cbdgef",
          "fgaecd",
          "cgeb",
          "fdcge",
          "agebfd",
          "fecdb",
          "fabcd",
          "edb"
        ]));
    expect(d.outputs, equals(["fdgacbe", "cefdb", "cefbgd", "gcbe"]));
  });
}
