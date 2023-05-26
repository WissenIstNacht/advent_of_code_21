import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../bin/day18/helpers/parser.dart';
import '../../bin/day18/p1.dart';

void main() {
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(18);
  });
  test("test d18p1's solve method", () {
    final solver = Day18Part1();
    var sfns = sampleInput.map(parse).toList();

    final res = solver.sum(sfns);
    expect(res.toString(),
        equals("[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]"));
  });
}
