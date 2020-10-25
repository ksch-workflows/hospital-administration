import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  final String title;
  final Widget body;

  Activity({this.title, this.body})
      : assert(title != null),
        assert(body != null);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(100),
        },
        children: [
          TableRow(
            children: [
              Icon(Icons.arrow_back, size: 40),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
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
