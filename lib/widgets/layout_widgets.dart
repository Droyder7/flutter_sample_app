import 'package:flutter/material.dart';

List<Widget> getPaddedWidgetList({required List<Widget> children}) {
  return children
      .map(
        (element) => Container(
          padding: const EdgeInsets.all(8.0),
          child: element,
        ),
      )
      .toList();
}
