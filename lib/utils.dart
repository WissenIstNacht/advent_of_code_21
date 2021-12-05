import 'dart:io';

List<String> readInput(int problem) {
  return File('bin/day$problem/input.txt').readAsLinesSync();
}

// Reads the sample input provided by AOC for the [day]-th
// day.
List<String> readSampleInput(int day) {
  return File('test/day$day/input/sample.txt').readAsLinesSync();
}

List<String> readTestInput(int day, String name) {
  return File('test/day$day/input/$name.txt').readAsLinesSync();
}

void prettyPrint(String result) {
  print("The result is: $result");
}
