import 'package:flutter/material.dart';
import 'package:flutter_sample_app/app/todo_app.dart';

class AppPage extends StatelessWidget {
  // Page widget contains Scaffold with app bar and body

  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TodoApp();
  }
}
