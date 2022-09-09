import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<String> items;
  // final double width;
  // List<String> get itemList => items;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String selectedValue;

  // _CustomDropdownState({required this.selectedValue});

  // _CustomDropdownState() : super() {
  //   selectedValue = widget.items.first;
  //   // print(widget.items);
  // }

  @override
  initState() {
    super.initState();
    selectedValue = widget.items.first;
  }

  void changeSelected(e) {
    // print(e);
    setState(() {
      selectedValue = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButton(
        value: selectedValue,
        onChanged: changeSelected,
        isExpanded: true,
        underline: Container(),
        items: widget.items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
      ),
    );
  }
}
