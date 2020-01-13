import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minimal_todo/data/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) => GestureDetector(
          onLongPress: () {
            taskData.removeTask(index);
          },
          child: CheckboxListTile(
            activeColor: Colors.indigo,
            value: taskData.tasks[index].isDone,
            title: Text(
              taskData.tasks[index].name,
              style: TextStyle(
                  decoration: taskData.tasks[index].isDone
                      ? TextDecoration.lineThrough
                      : null,
                  color: taskData.tasks[index].isDone ? Colors.grey : null),
            ),
            onChanged: (value) {
              taskData.toggleDone(index);
            },
          ),
        ),
        itemCount: taskData.taskCount,
      );
    });
  }
}
