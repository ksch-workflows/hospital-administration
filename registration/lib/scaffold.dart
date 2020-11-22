import 'package:flutter/material.dart';
import 'package:registration/test_bench.dart';

class PageFrame extends StatelessWidget {
  final Widget body;

  PageFrame({@required this.body}) : assert(body != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [_AppBar(), body],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBarColor = Theme.of(context).primaryColor;
    final buttonColor = Theme.of(context).buttonColor;

    return Container(
      color: appBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _homeButton(buttonColor),
          _actionButtons(buttonColor),
        ],
      ),
    );
  }

  IconButton _homeButton(Color color) {
    return IconButton(
      icon: Icon(Icons.home, color: color),
      onPressed: () => print("TODO: Navigate to home screen"),
    );
  }

  Row _actionButtons(Color color) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: color,
          ),
          onPressed: () => print("TODO: Open settings dialog"),
        ),
        IconButton(
          icon: Icon(
            Icons.logout,
            color: color,
          ),
          onPressed: () => print("TODO: Trigger logout"),
        ),
      ],
    );
  }
}

void main() {
  runApp(
    TestBench(
      child: PageFrame(
        body: Row(
          children: [
            const Text('Hello, Test Bench!'),
          ],
        ),
      ),
    ),
  );
}
