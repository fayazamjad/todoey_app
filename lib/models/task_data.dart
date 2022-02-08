import 'package:flutter/cupertino.dart';
import 'package:todoey_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  int get taskcount {
    return tasks.length;
  }

  void addData(String data) {
    final task = Task(name: data);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggledone();
    notifyListeners();
  }

  void deleteTask(Task removedata) {
    tasks.remove(removedata);
    notifyListeners();
  }
}
