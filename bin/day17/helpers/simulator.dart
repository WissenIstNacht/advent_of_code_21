import 'probe.dart';
import 'targetArea.dart';

class Simulator {
  Probe probe;
  TargetArea targetArea;
  int step = 0;

  Simulator(this.probe, this.targetArea);

  void simulate() {
    print("simulate");
    while (!probe.isInArea(targetArea) && !probe.isPastArea(targetArea)) {
      print("Move");
      probe.move(step);
      step++;
    }
  }
}
