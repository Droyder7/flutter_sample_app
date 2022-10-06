import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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


class ShowFuture<T> extends StatefulWidget {
  final Future<T?> Function() getFuture;
  final Widget Function(T data) onDone;
  final Widget onLoading;

  const ShowFuture({
    Key? key,
    required this.getFuture,
    required this.onDone,
    this.onLoading = const CircularProgressIndicator(),
  }) : super(key: key);

  @override
  State<ShowFuture<T>> createState() => _ShowFutureState();
}

class _ShowFutureState<T> extends State<ShowFuture<T>> {
  late Future<T?> dataFuture;

  void fetchFuture() {
    setState(() {
      dataFuture = widget.getFuture();
    });
  }

  @override
  void initState() {
    super.initState();
    dataFuture = widget.getFuture();
  }

  Widget showError(dynamic error) {
    return showAlert(
      title: 'Error',
      content: error.toString(),
    );
  }

  AlertDialog showAlert({required title, required content}) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: fetchFuture,
          child: const Text('Retry'),
        ),
        TextButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              SystemNavigator.pop();
            }
          },
          child: const Text('Exit'),
        ),
      ],
    );
  }

  Widget showLoading() {
    return Center(
      child: widget.onLoading,
    );
  }

  Widget showData(T? data) {
    return data != null ? widget.onDone(data) : showEmpty();
  }

  Widget showEmpty() {
    return showAlert(
      title: 'No Data',
      content: 'Null data found',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomFutureBuilder<T?>(
        dataFuture: dataFuture,
        onLoading: showLoading,
        onError: showError,
        onDone: showData,
        onEmpty: showEmpty,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchFuture,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class CustomFutureBuilder<T> extends StatelessWidget {
  final Future dataFuture;
  final Widget Function() onLoading;
  final Widget Function() onEmpty;
  final Widget Function(dynamic error) onError;
  final Widget Function(T data) onDone;

  const CustomFutureBuilder({
    Key? key,
    required this.dataFuture,
    required this.onLoading,
    required this.onError,
    required this.onDone,
    required this.onEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: dataFuture as Future<T>,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return onLoading();
        } else {
          if (snapshot.hasError) {
            return onError(snapshot.error);
          } else if (snapshot.hasData) {
            return onDone(snapshot.data as T);
          } else {
            return onEmpty();
          }
        }
      },
    );
  }
}