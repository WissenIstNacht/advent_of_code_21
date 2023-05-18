import 'probe.dart';
import 'targetArea.dart';

class Simulator {
  TargetArea targetArea;
  int step = 0;

  Simulator(this.targetArea);

  void simulate(Probe probe) {
    print("simulate");
    while (!probe.isInArea(targetArea) && !probe.isPastArea(targetArea)) {
      print("Move");
      probe.move(step);
      step++;
    }
  }

  bool hitsArea(Probe probe) {
    var step = 0;
    while (!probe.isPastArea(targetArea)) {
      probe.move(step);
      step++;
      if (probe.isInArea(targetArea)) return true;
    }
    return false;
  }
}
