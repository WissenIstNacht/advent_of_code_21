import 'dart:io';

List<String> readInput(int problem) {
  return File('bin/day$problem/input.txt').readAsLinesSync();
}

void prettyPrint(String result) {
  print("The result is: $result");
}
