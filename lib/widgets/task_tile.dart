import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';

class TaskTile extends StatelessWidget {
  late final bool ischeck;
  late final String taskTitle;
  late final Function checkboxCallback;
  late final Function onlongpress;
  TaskTile(
      {required this.taskTitle,
      required this.ischeck,
      required this.checkboxCallback,
      required this.onlongpress});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, valuedata, child) {
      return ListTile(
        onLongPress: () {
          onlongpress();
        },
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: ischeck ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: ischeck,
          onChanged: (value) => checkboxCallback(value),
        ),
      );
    });
  }
}
