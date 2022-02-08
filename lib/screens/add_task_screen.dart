import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';

String taskText = 'null';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.lightBlueAccent),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (value != null) {
                    taskText = value.toString();
                  } else {
                    taskText = 'null';
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'Write Task Text Here....',
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.lightBlue),
                  onPressed: () {
                    if (taskText == 'null' || taskText.trim().isEmpty == true) {
                      Fluttertoast.showToast(msg: 'Task Text Field is Empty');
                    } else {
                      Provider.of<TaskData>(context, listen: false)
                          .addData(taskText);
                      taskText = 'null';
                      print(
                          '${Provider.of<TaskData>(context, listen: false).tasks.length} +fayaz');
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
