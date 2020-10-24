import 'package:flutter/material.dart';

class TestBench extends StatelessWidget {
  final Widget testSubject;

  TestBench(this.testSubject) : assert(testSubject != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Bench',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test Bench'),
        ),
        body: Center(
          child: testSubject,
        ),
      ),
    );
  }
}
