import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';
import 'package:todoey_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskdata.tasks[index].name,
              ischeck: taskdata.tasks[index].isdone,
              checkboxCallback: (statuscheckbox) {
                taskdata.updateTask(taskdata.tasks[index]);
              },
              onlongpress: () => taskdata.deleteTask(taskdata.tasks[index]),
            );
          },
          itemCount: taskdata.taskcount,
        );
      },
    );
  }
}
