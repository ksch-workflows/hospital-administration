import 'package:flutter/material.dart';

class TestBench extends StatelessWidget {
  final Widget child;
  final bool isFullPage;

  TestBench({this.child, this.isFullPage = false}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Bench',
      home: isFullPage ? child : wrapComponentInScaffold(),
    );
  }

  Scaffold wrapComponentInScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Bench'),
      ),
      body: Padding(
        padding: EdgeInsets.all(100.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
