class Instruction {
  late InstructionType type;
  late int value;

  Instruction.parse(String s) {
    final parts = s.split(" ");
    final direction = parts.first;

    switch (direction) {
      case "up":
        type = InstructionType.up;
        break;
      case "down":
        type = InstructionType.down;
        break;
      case "forward":
        type = InstructionType.forward;
        break;
      default:
        throw FallThroughError();
    }
    value = int.parse(parts.last);
  }

  // Queries ===================================================================

  bool isUp() => type == InstructionType.up;
  bool isDown() => type == InstructionType.down;
  bool isForward() => type == InstructionType.forward;
}

enum InstructionType { up, down, forward }
