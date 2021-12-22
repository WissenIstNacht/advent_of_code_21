import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../../bin/day8/helpers/display.dart';

void main() {
  final miniInput =
      "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf";
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
  test('covers method', () {
    final d = Display.parse(miniInput);
    expect(d.covers('cdfgeb', "ab"), isFalse);
    expect(d.covers('cagedb', "ab"), isTrue);
    expect(d.covers('cefabd', "ab"), isTrue);
    expect(d.covers('fbcad', "ab"), isTrue);
  });
  test('unions method', () {
    final d = Display.parse(miniInput);
    expect(d.unionFiveOne('cdfbe', "ab"), "cdfbea");
  });
  test('Properly decodes inputs from mini sample display', () {
    final d = Display.parse(miniInput);
    d.decodeInputs();
    expect(d.decoder[d.inputs[0]], equals(8));
    expect(d.decoder[d.inputs[1]], equals(5));
    expect(d.decoder[d.inputs[2]], equals(2));
    expect(d.decoder[d.inputs[3]], equals(3));
    expect(d.decoder[d.inputs[4]], equals(7));
    expect(d.decoder[d.inputs[5]], equals(9));
    expect(d.decoder[d.inputs[6]], equals(6));
    expect(d.decoder[d.inputs[7]], equals(4));
    expect(d.decoder[d.inputs[8]], equals(0));
    expect(d.decoder[d.inputs[9]], equals(1));
  });
  test('Properly decodes outputs from mini sample display', () {
    final d = Display.parse(miniInput);
    d.decodeInputs();
    final res = d.decodeOutputs();
    expect(res, equals(5353));
  });
  test('Properly decodes outputs from sample display', () {
    final d = Display.parse(sampleInput.first);
    d.decodeInputs();
    final res = d.decodeOutputs();
    expect(res, equals(8394));
  });
}
