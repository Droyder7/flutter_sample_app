import 'package:flutter/material.dart';
import 'package:flutter_sample_app/config/size_config.dart';
import 'package:flutter_sample_app/app_page.dart';
import 'package:flutter_sample_app/widgets/device_preview_widgets.dart';

void main() {
  runApp(
    getDevicePreviewOnApp(
      app: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getMaterialAppWithPreview(
      context: context,
      title: 'Flutter Sample App',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // initialize SizeConfig with context

    return const SafeArea(
      child: AppPage(),
    );
  }
}
