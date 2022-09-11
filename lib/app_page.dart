import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  // Page widget contains Scaffold with app bar and body

  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: Container(),
    );
  }
}
