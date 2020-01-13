import 'package:flutter/cupertino.dart';
import 'package:minimal_todo/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Change phone battery'),
    Task(name: 'Get better at flutter'),
    Task(name: 'Buy new shoes')
  ];

  void addTask(String name) {
    tasks.add(Task(name: name));
    notifyListeners();
  }

  bool taskEmpty() {
    if (tasks.isEmpty) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  void removeTask(int index) {
    tasks.remove(tasks[index]);
    notifyListeners();
  }

  void toggleDone(int index) {
    tasks[index].toggleDone();
    notifyListeners();
  }

  void removeAllTasks() {
    tasks = [];
    notifyListeners();
  }
  int get taskCount {
    return tasks.length;
  }
}