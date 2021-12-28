class Octopus {
  late int content;

  Octopus.parse(String s) {
    content = int.parse(s);
  }

  bool isFull() => content > 9;

  void flash() => content = 0;

  void fill() => content++;
}
