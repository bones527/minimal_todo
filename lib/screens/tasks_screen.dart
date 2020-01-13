import 'package:flutter/material.dart';
import 'package:minimal_todo/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:minimal_todo/data/task_data.dart';
import 'package:minimal_todo/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => AddTaskScreen());
        },
        backgroundColor: Colors.indigoAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.black,
          ),
          tooltip: 'Delete all tasks',
          onPressed: () {
            showDialog<Null>(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return SimpleDialog(
                    title:
                        Center(child: Text('Do you want to delete all tasks?')),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SimpleDialogOption(
                            child: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SimpleDialogOption(
                            child: Icon(Icons.done),
                            onPressed: () {
                              Provider.of<TaskData>(context, listen: false)
                                  .removeAllTasks();
                              Navigator.pop(context);
                            },
                          )
                        ],
                      )
                    ],
                  );
                });
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Todo List',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            tooltip: 'Add new task',
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => AddTaskScreen());
            },
          )
        ],
      ),
      body: Provider.of<TaskData>(context).tasks.isEmpty
          ? Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Icon(
                    Icons.add_circle_outline,
                    size: 150,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'No tasks added yet!',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            )
          : TasksList(),
    );
  }
}
