import 'package:flutter/material.dart';
import 'package:flutter_sample_app/config/size_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // initialize SizeConfig with context

    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: Container(),
    );
  }
}
