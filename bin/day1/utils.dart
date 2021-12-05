int countIncreases(List<int> input) {
  var counter = 0;
  for (var i = 0; i < input.length - 1; i++) {
    final curr = input[i];
    final next = input[i + 1];
    if (isIncreasing(curr, next)) {
      counter++;
    }
  }
  return counter;
}

bool isIncreasing(num a, num b) => b - a > 0;
