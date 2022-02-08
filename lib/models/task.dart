class Task {
  late String name;
  late bool isdone;
  Task({required this.name, this.isdone = false});

  void toggledone() {
    isdone = !isdone;
  }
}
