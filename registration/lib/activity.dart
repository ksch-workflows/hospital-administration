import 'package:flutter/material.dart';
import 'package:registration/test_bench.dart';

class Activity extends StatelessWidget {
  final String title;
  final Widget body;
  final Function onNavigateBack;
  final Widget floatingActionButton;

  Activity({
    @required this.title,
    @required this.body,
    this.onNavigateBack,
    this.floatingActionButton,
  })  : assert(title != null),
        assert(body != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Scaffold(
        body: Align(
          alignment: Alignment.topLeft,
          child: Table(
            columnWidths: {
              0: FixedColumnWidth(100),
            },
            children: [
              TableRow(
                children: [
                  onNavigateBack != null ? _buildBackButton() : _EmptyCell(),
                  _buildTitleLabel(),
                ],
              ),
              TableRow(
                children: [
                  _EmptyCell(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 50, 0, 0),
                    child: body,
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: floatingActionButton,
      ),
    );
  }

  Text _buildTitleLabel() {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 35,
      ),
    );
  }

  IconButton _buildBackButton() {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: onNavigateBack,
    );
  }
}

/// Widget which does nothing but filling a slot in the table.
class _EmptyCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void main() {
  runApp(
    TestBench(
      child: Activity(
        title: "Demo",
        body: Text("Hello, World!!"),
      ),
    ),
  );
}

