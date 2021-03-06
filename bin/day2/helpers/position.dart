import 'instruction.dart';

class Position {
  int _horizontal = 0;
  int _depth = 0;

  int get horizontal => _horizontal;
  int get depth => _depth;

  void move(Instruction instr) {
    if (instr.isUp()) {
      _depth -= instr.value;
    } else if (instr.isDown()) {
      _depth += instr.value;
    } else {
      _horizontal += instr.value;
    }
  }
}

class Position2 extends Position {
  int _aim = 0;

  @override
  void move(Instruction instr) {
    if (instr.isUp()) {
      _aim -= instr.value;
    } else if (instr.isDown()) {
      _aim += instr.value;
    } else {
      _horizontal += instr.value;
      _depth += _aim * instr.value;
    }
  }
}
