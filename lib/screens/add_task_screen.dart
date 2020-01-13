import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minimal_todo/data/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTask;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              'Add Task',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (text) {
                newTask = text;
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
              autofocus: true,
            ),
            FlatButton(
              child: Icon(Icons.add),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(newTask);
                print(Provider.of<TaskData>(context, listen: false).tasks);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
