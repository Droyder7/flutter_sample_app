import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';

DevicePreview getDevicePreviewOnApp({required Widget app}) {
  return DevicePreview(
    enabled: !kReleaseMode,
    storage: DevicePreviewStorage.preferences(),
    builder: (context) => app,
  );
}

MaterialApp getMaterialAppWithPreview({
  required BuildContext context,
  required String title,
  required Widget home,
}) {
  return MaterialApp(
    title: title,
    debugShowCheckedModeBanner: false,
    useInheritedMediaQuery: true,
    locale: DevicePreview.locale(context),
    builder: DevicePreview.appBuilder,
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    home: home,
  );
}
