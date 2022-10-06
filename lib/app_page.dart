import 'package:flutter/material.dart';
import 'package:flutter_sample_app/app/photos_page.dart';

class AppPage extends StatelessWidget {
  // Page widget contains Scaffold with app bar and body

  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sample App'),
      ),
      body: const PhotosPage(),
    );
  }
}
