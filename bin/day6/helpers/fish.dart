class Fish {
  late int daysToReproduce;

  Fish() : daysToReproduce = 8;

  Fish.withOffset(this.daysToReproduce);

  void age() => daysToReproduce--;

  bool canReproduce() => daysToReproduce == 0;

  Fish reproduce() {
    daysToReproduce = 6;
    return Fish();
  }
}
