import 'package:flutter/material.dart';

import 'package:flutter_sample_app/config/constants.dart';
import 'package:flutter_sample_app/config/size_config.dart';

import 'package:flutter_sample_app/app/task_model.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // late final double deviceHeight, deviceWidth;

  List<TaskModel> tasks = [
    TaskModel(
      content: 'Do Laundry',
    ),
    TaskModel(
      content: 'Take Bath',
      isDone: true,
    ),
  ];

  String? newTaskContent;

  @override
  Widget build(BuildContext context) {
    // deviceHeight = MediaQuery.of(context).size.height;
    // deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getHeight(10),
        title: Text(
          widget.toString(),
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: taskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: diaspalyAddTaskPopup,
        child: const Icon(Icons.add),
      ),
    );
  }

  void diaspalyAddTaskPopup() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Add New Task'),
            content: TextFormField(
              initialValue: newTaskContent,
              autofocus: true,
              onFieldSubmitted: (value) {
                setState(() {
                  tasks.add(TaskModel(content: value));
                });
                newTaskContent = null;
                Navigator.pop(context);
              },
              onChanged: (value) {
                setState(() {
                  newTaskContent = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a Task',
              ),
            ),
          );
        });
  }

  Widget taskList() {
    return ListView(
      children: tasks.map((e) => taskTile(e)).toList(),
    );
  }

  Widget taskTile(TaskModel task) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        // tileColor: Colors.red,
        // contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        leading: Image.asset(IMAGE_PATH),
        // isThreeLine: true,
        title: Text(
          task.content,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          task.timestamp.toString(),
        ),
        trailing: IconButton(
          icon: Icon(task.isDone
              ? Icons.check_box_outlined
              : Icons.check_box_outline_blank),
          onPressed: () {
            setState(() {
              task.toggleDoneStatus();
            });
          },
        ),
      ),
    );
  }
}
