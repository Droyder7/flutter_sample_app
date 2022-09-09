import 'package:flutter/material.dart';
import 'package:flutter_sample_app/config/size_config.dart';
import 'package:flutter_sample_app/app_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sample App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // initialize SizeConfig with context

    const appWidget = AppPage();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(appWidget.toString()),
        ),
        body: appWidget,
      ),
    );
  }
}
